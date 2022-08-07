import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:gitfy/common/global.dart';
import 'package:gitfy/pages/repository/repository_page.dart';
import 'package:gitfy/pages/settings/settings_page.dart';
import 'package:gitfy/pages/upgrade/upgrade_page.dart';
import 'package:oktoast/oktoast.dart';

import '../generated/l10n.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/top_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _tabIndex = 0;
  late PageController _pageController;

  late List<Widget> _pages;

  void initPages() {
    _pageController = PageController(initialPage: _tabIndex);
    _pages = [
      const KeepAliveWrapper(child: RepositoryPage()),
      const KeepAliveWrapper(child: UpgradePage()),
      const KeepAliveWrapper(child: SettingsPage())
    ];
  }

  void _pageChanged(int index) {
    setState(() {
      if (_tabIndex != index) _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    initPages();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: buildAppBar(context),
      body: buildBody(context),
      bottomNavigationBar: BottomNavigation(
        tabIndex: _tabIndex,
        pageController: _pageController,
      ),
      floatingActionButton: _tabIndex != 0
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Global.application.user == null
                    ? _showAlert(context)
                    : _showAdd(context);
              }),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return const TopBar(title: "Gitfy");
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: PageView(
          // 禁止页面左右滑动切换
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: _pageChanged,
          children: _pages),
    );
  }

  Future _showAdd(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          var controller = TextEditingController();
          return AlertDialog(
            title: Text(S.current.floatButtonAddTitle),
            content: SingleChildScrollView(
                child: ListBody(children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: S.current.floatButtonAddHint,
                  hintText: "https://github/SukiEva/Gitfy",
                ),
              )
            ])),
            actions: [
              TextButton(
                  onPressed: () async {
                    var link = controller.text.substring(8).split('/');
                    if (link.length != 3 || link[0] != "github.com") {
                      showToast(S.current.floatButtonAddSubscribeError);
                      return;
                    }
                    var success = await Global.dao.follow(link);
                    if (!success) {
                      showToast(S.current.floatButtonAddSubscribeFail);
                      return;
                    }
                    showToast(S.current.floatButtonAddSubscribeToast);
                    if (!mounted) return;
                    Navigator.of(context).pop(context);
                  },
                  child: Text(S.current.floatButtonAddSubscribe)),
            ],
          );
        });
  }

  Future _showAlert(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(S.current.floatButtonDialogTitle),
            children: [
              SimpleDialogOption(
                  child: Text(S.current.floatButtonDialogUserEmpty)),
              SimpleDialogOption(
                  child: Text(S.current.floatButtonDialogUserHint))
            ],
          );
        });
  }
}
