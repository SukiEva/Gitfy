import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class BottomNavigation extends StatefulWidget {
  final int tabIndex;

  //final Function(int index) pageController;
  final PageController pageController;

  const BottomNavigation(
      {Key? key, this.tabIndex = 0, required this.pageController})
      : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int _tabIndex;

  @override
  Widget build(BuildContext context) {
    _tabIndex = widget.tabIndex;
    var locale = S.current;
    var navigationDestinations = <NavigationDestination>[
      NavigationDestination(
          icon: const Icon(Icons.dashboard_outlined),
          label: locale.bottomNavigationRepositoryTab),
      NavigationDestination(
          icon: const Icon(Icons.extension_outlined),
          label: locale.bottomNavigationApplicationTab),
      NavigationDestination(
          icon: const Icon(Icons.rocket_launch_outlined),
          label: locale.bottomNavigationUpgradeTab),
      NavigationDestination(
          icon: const Icon(Icons.settings_outlined),
          label: locale.bottomNavigationSettingTab),
    ];
    return NavigationBar(
        destinations: navigationDestinations,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: _tabIndex,
        onDestinationSelected: (index) {
          setState(() {
            _tabIndex = index;
            //widget.pageController(index);
            widget.pageController.jumpToPage(index);
          });
        });
  }
}
