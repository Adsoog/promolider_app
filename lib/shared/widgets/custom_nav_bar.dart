import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
      onItemSelected: (value) {},
      items: [
        FlashyTabBarItem(
          icon: const Icon(TablerIcons.home),
          title: const Text('Home'),
        ),
        FlashyTabBarItem(
          icon: const Icon(TablerIcons.home),
          title: const Text('Home'),
        ),
      ],
    );
  }
}
