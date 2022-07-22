import 'package:flutter/material.dart';
import 'package:gitfy/widgets/list_item.dart';

import '../generated/l10n.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    var locale = S.current;
    return ListView(
      children: [
        ListTile(
          // 常规
          title: Text(locale.settingsPageTitleCommon),
          textColor: color.primary,
        ),
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
          body: "https://github.com/SukiEva/gitfy",
          launch: "https://github.com/SukiEva/gitfy",
        ),
        ListItem(
          // 反馈
          icon: Icons.bug_report,
          title: locale.settingsPageTileBugReport,
          body: locale.settingsPageTileBugReportDetail,
          launch: "https://github.com/SukiEva/gitfy/issues",
        ),
        ListItem(
            // 应用版本
            icon: Icons.android,
            title: locale.settingsPageTileAppVersion,
            body: "1.0.0"),
        ListItem(
            // 隐私政策
            icon: Icons.privacy_tip,
            title: locale.settingsPageTilePrivacy),
      ],
    );
  }
}
