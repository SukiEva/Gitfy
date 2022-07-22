import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gitfy/common/theme/color.dart';
import 'package:gitfy/pages/home.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../provider/application.dart';

class Material3App extends StatelessWidget {
  const Material3App({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => Application())],
        child: DynamicColorBuilder(
            builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
          ColorScheme lightColorScheme;
          ColorScheme darkColorScheme;
          if (lightDynamic != null && darkDynamic != null) {
            // On Android S+ devices, use the provided dynamic color scheme.
            // (Recommended) Harmonize the dynamic color scheme' built-in semantic colors.
            lightColorScheme = lightDynamic.harmonized();
            // Repeat for the dark color scheme.
            darkColorScheme = darkDynamic.harmonized();
          } else {
            // Otherwise, use fallback schemes.
            lightColorScheme = materialScheme(false);
            darkColorScheme = materialScheme(true);
          }
          return MaterialApp(
            title: 'Gitfy',
            theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
            darkTheme:
                ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
            home: const MainScreen(),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        }));
  }
}
