import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:gitfy/pages/repository/repository_page.dart';
import 'package:gitfy/pages/settings/settings_page.dart';
import 'package:gitfy/pages/upgrade/upgrade_page.dart';

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
      floatingActionButton:
          _tabIndex != 0 ? null :
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {}
          ),
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
}
