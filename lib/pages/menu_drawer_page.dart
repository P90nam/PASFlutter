import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/menu_drawer_controller.dart';

class MenuDrawerPage extends StatelessWidget {
  MenuDrawerPage({super.key});

  final MainMenuController mainMenuController = Get.put(MainMenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191B1D),
      body: Row(
        children: [
          // Sidebar Navigasi di Samping
          Obx(
            () => NavigationRail(
              backgroundColor: const Color(0xFF27292D),
              selectedIndex: mainMenuController.selectedIndex.value,
              onDestinationSelected: (index) {
                mainMenuController.selectedIndex.value = index;
              },
              labelType: NavigationRailLabelType.all,
              unselectedIconTheme: const IconThemeData(color: Colors.grey),
              selectedIconTheme: const IconThemeData(color: Color(0xFF8A56AC)),
              unselectedLabelTextStyle: const TextStyle(color: Colors.grey),
              selectedLabelTextStyle: const TextStyle(
                color: Color(0xFF8A56AC),
                fontWeight: FontWeight.bold,
              ),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.history_outlined),
                  selectedIcon: Icon(Icons.history),
                  label: Text('History'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: Text('Profile'),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
            color: Color(0xFF33353A),
          ),
          // Area Halaman Utama dengan IndexedStack
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: mainMenuController.selectedIndex.value,
                children: mainMenuController.pages,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
