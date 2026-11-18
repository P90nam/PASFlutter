import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/menu_drawer_controller.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MainMenuController>();
    const backgroundColor = Color(0xFF191B1D);
    const cardColor = Color(0xFF27292D);
    const accent = Color(0xFFF2F4F5);

    Widget menuItem({
      required int index,
      required IconData icon,
      required String label,
    }) {
      final selected = controller.selectedIndex.value == index;
      return ListTile(
        leading: Icon(icon, color: selected ? accent : Colors.white54),
        title: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : const Color(0xFFB8BDC1),
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        selected: selected,
        selectedTileColor: cardColor,
        onTap: () => controller.changepage(index),
      );
    }

    return Drawer(
      backgroundColor: backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 52, 16, 16),
            decoration: const BoxDecoration(
              color: cardColor,
              border: Border(bottom: BorderSide(color: Color(0xFF393B3D))),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Color(0xFF393B3D),
                  child: Icon(Icons.person, color: Colors.white, size: 36),
                ),
                SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Zaki turu',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.circle, color: Color(0xFF00B06F), size: 10),
                        SizedBox(width: 6),
                        Text(
                          'Online',
                          style: TextStyle(color: Color(0xFF00B06F)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Obx(
            () => menuItem(index: 0, icon: Icons.home_rounded, label: 'Home'),
          ),
          Obx(
            () => menuItem(
              index: 1,
              icon: Icons.history_rounded,
              label: 'History',
            ),
          ),
          Obx(
            () => menuItem(
              index: 2,
              icon: Icons.person_rounded,
              label: 'Profile',
            ),
          ),
        ],
      ),
    );
  }
}
