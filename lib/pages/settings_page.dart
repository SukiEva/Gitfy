import 'package:flutter/material.dart';
import 'package:gitfy/widgets/list_item.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../states/locale_model.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _language = "Default";
  String _version = "";

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var locale = S.current;
    var localeModel = Provider.of<LocaleModel>(context);
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      _version = "${packageInfo.version}(${packageInfo.buildNumber})";
    });

    PopupMenuItem _buildLanguageItem(String lan, value) {
      return PopupMenuItem(
        child: Text(
          lan,
          // 对APP当前语言进行高亮显示
          style: TextStyle(
              color: localeModel.locale == value ? color.primary : null),
        ),
        onTap: () {
          // 此行代码会通知MaterialApp重新build
          localeModel.locale = value;
          _language = lan;
        },
      );
    }

    return ListView(
      children: [
        ListTile(
          // 常规
          title: Text(locale.settingsPageTitleCommon),
          textColor: color.primary,
        ),
        PopupMenuButton(
            color: color.onInverseSurface,
            child: ListItem(
              icon: Icons.language,
              title: locale.settingsPageTileLanguage,
              body: _language,
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  _buildLanguageItem("Default", null),
                  _buildLanguageItem("中文简体", "zh_CN"),
                  _buildLanguageItem("English", "en"),
                ]),
        ListTile(
          // 其它
          title: Text(locale.settingsPageTitleOthers),
          textColor: color.primary,
        ),
        ListItem(
          // 作者
          icon: Icons.person,
          title: locale.settingsPageTileAuthor,
          body: "SukiEva",
          launch: "https://github.com/SukiEva",
        ),
        ListItem(
          // 源代码
          icon: Icons.code,
          title: locale.settingsPageTileSourceCode,
          body: "https://github.com/SukiEva/Gitfy",
          launch: "https://github.com/SukiEva/Gitfy",
        ),
        ListItem(
          // 反馈
          icon: Icons.bug_report,
          title: locale.settingsPageTileBugReport,
          body: locale.settingsPageTileBugReportDetail,
          launch: "https://github.com/SukiEva/Gitfy/issues",
        ),
        ListItem(
            // 应用版本
            icon: Icons.android,
            title: locale.settingsPageTileAppVersion,
            body: _version),
        ListItem(
            // 隐私政策
            icon: Icons.privacy_tip,
            title: locale.settingsPageTilePrivacy),
      ],
    );
  }
}
