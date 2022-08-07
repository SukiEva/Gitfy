import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gitfy/common/color.dart';
import 'package:gitfy/states/user_state.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../states/locale_state.dart';
import 'main_screen.dart';

class Material3App extends StatelessWidget {
  const Material3App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LocaleState()),
          ChangeNotifierProvider(create: (_) => UserState())
        ],
        child: DynamicColorBuilder(
            builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
          ColorScheme lightColorScheme;
          ColorScheme darkColorScheme;
          if (lightDynamic != null && darkDynamic != null) {
            lightColorScheme = lightDynamic.harmonized();
            darkColorScheme = darkDynamic.harmonized();
          } else {
            lightColorScheme = materialScheme(false);
            darkColorScheme = materialScheme(true);
          }
          return Consumer<LocaleState>(
              builder: (BuildContext context, localeState, child) {
            return OKToast(
                position: const ToastPosition(align: Alignment.bottomCenter),
                backgroundColor:
                    Theme.of(context).backgroundColor.withOpacity(0.5),
                child: MaterialApp(
                  title: 'Gitfy',
                  theme: ThemeData(
                      useMaterial3: true, colorScheme: lightColorScheme),
                  darkTheme: ThemeData(
                      useMaterial3: true, colorScheme: darkColorScheme),
                  home: const MainScreen(),
                  locale: localeState.getLocale(),
                  supportedLocales: S.delegate.supportedLocales,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  localeResolutionCallback: (sysLocale, supportedLocales) {
                    if (localeState.getLocale() != null) {
                      //如果已经选定语言，则不跟随系统
                      return localeState.getLocale();
                    } else {
                      //跟随系统
                      Locale locale;
                      if (supportedLocales.contains(sysLocale)) {
                        locale = sysLocale!;
                      } else {
                        //如果系统语言不是中文简体或美国英语，则默认使用美国英语
                        locale = const Locale('en', 'US');
                      }
                      return locale;
                    }
                  },
                ));
          });
        }));
  }

  ColorScheme materialScheme(bool isDark) {
    if (!isDark) {
      return const ColorScheme(
          brightness: Brightness.light,
          primary: MaterialLight.primary,
          onPrimary: MaterialLight.onPrimary,
          primaryContainer: MaterialLight.primaryContainer,
          secondary: MaterialLight.secondary,
          onSecondary: MaterialLight.onSecondary,
          error: MaterialLight.error,
          onError: MaterialLight.onError,
          background: MaterialLight.background,
          onBackground: MaterialLight.onBackground,
          surface: MaterialLight.surface,
          onSurface: MaterialLight.onSurface);
    } else {
      return const ColorScheme(
          brightness: Brightness.dark,
          primary: MaterialDark.primary,
          onPrimary: MaterialDark.onPrimary,
          primaryContainer: MaterialDark.primaryContainer,
          secondary: MaterialDark.secondary,
          onSecondary: MaterialDark.onSecondary,
          error: MaterialDark.error,
          onError: MaterialDark.onError,
          background: MaterialDark.background,
          onBackground: MaterialDark.onBackground,
          surface: MaterialDark.surface,
          onSurface: MaterialDark.onSurface);
    }
  }
}
