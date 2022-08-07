import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gitfy/common/global.dart';
import 'package:gitfy/widgets/list_item.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../states/locale_state.dart';
import '../../states/user_state.dart';

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
    var localeModel = Provider.of<LocaleState>(context);
    var packageInfo = Global.packageInfo;
    _version = "${packageInfo.version}(${packageInfo.buildNumber})";

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
      padding: EdgeInsets.zero,
      children: [
        ListTile(
          // 常规
          title: Text(locale.settingsPageTitleCommon),
          textColor: color.primary,
        ),
        ListItem(
            icon: Icons.sync,
            title: locale.settingsPageTileSync,
            onTap: () {
              _showSync(context);
            }),
        PopupMenuButton(
            color: color.onInverseSurface,
            child: ListItem(
              icon: Icons.language,
              title: locale.settingsPageTileLanguage,
              subtitle: _language,
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
          subtitle: "SukiEva",
          launch: "https://github.com/SukiEva",
        ),
        ListItem(
          // 源代码
          icon: Icons.code,
          title: locale.settingsPageTileSourceCode,
          subtitle: "https://github.com/SukiEva/Gitfy",
          launch: "https://github.com/SukiEva/Gitfy",
        ),
        ListItem(
          // 反馈
          icon: Icons.bug_report,
          title: locale.settingsPageTileBugReport,
          subtitle: locale.settingsPageTileBugReportDetail,
          launch: "https://github.com/SukiEva/Gitfy/issues",
        ),
        ListItem(
            // 应用版本
            icon: Icons.android,
            title: locale.settingsPageTileAppVersion,
            subtitle: _version),
        ListItem(
            // 隐私政策
            icon: Icons.privacy_tip,
            title: locale.settingsPageTilePrivacy),
      ],
    );
  }

  Future<void> _showSync(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Consumer<UserState>(
            builder: (BuildContext context, userState, child) {
          var controller = TextEditingController();
          var userChange = Provider.of<UserState>(context);
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
            title: Text(S.current.settingsPageTileSync),
            content: SingleChildScrollView(
                child: ListBody(
              children: [
                TextField(
                  readOnly: true,
                  controller:
                      TextEditingController(text: userState.user ?? "null"),
                  decoration: InputDecoration(
                    labelText: S.current.settingsPageSyncCredentials,
                  ),
                  onTap: () {
                    Clipboard.setData(
                        ClipboardData(text: Global.application.user));
                    showToast(S.current.toastCopiedToClipboard);
                  },
                ),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: S.current.settingsPageSyncSwitch,
                  ),
                )
              ],
            )),
            actions: [
              if (Global.application.user == null)
                TextButton(
                    onPressed: () async {
                      userChange.user = await Global.dao.register();
                      showToast(S.current.toastRegisterSuccess);
                      if (!mounted) return;
                      Navigator.of(context).pop(context);
                    },
                    child: Text(S.current.settingsPageSyncButtonRegister)),
              TextButton(
                  onPressed: () {
                    userChange.user = controller.text;
                    showToast(S.current.toastSwitchSuccess);
                    Navigator.of(context).pop(context);
                  },
                  child: Text(S.current.settingsPageSyncButtonSwitch)),
              // TextButton(
              //     onPressed: () {
              //       showToast(S.current.toastSyncProcessing);
              //       Navigator.of(context).pop();
              //     },
              //     child: Text(S.current.settingsPageSyncButtonSync))
            ],
          );
        });
      },
    );
  }
}
