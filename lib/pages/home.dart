import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:gitfy/pages/application_page.dart';
import 'package:gitfy/pages/repository_page.dart';
import 'package:gitfy/pages/settings_page.dart';
import 'package:gitfy/pages/upgrade_page.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/top_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _tabIndex = 0;
  final _pageController = PageController();

  late List<Widget> _pages;

  void initPages() {
    _pages = [
      const KeepAliveWrapper(child: RepositoryPage()),
      const KeepAliveWrapper(child: ApplicationPage()),
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
      appBar: const TopBar(title: "Gitfy"),
      body: SafeArea(child:
          //_pages.elementAt(_tabIndex)
            PageView.builder(
                // 禁止页面左右滑动切换
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: _pageChanged,
                itemCount: _pages.length,
                itemBuilder: (context, index) => _pages[index]),
          ),
      bottomNavigationBar: BottomNavigation(
        tabIndex: _tabIndex,
        //pageController: (index) => _pageChanged(index),
        pageController: _pageController,
      ),
    );
  }
}
