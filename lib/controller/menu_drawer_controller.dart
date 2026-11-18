import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../menu/home.dart';
import '../menu/feat.dart';
import '../menu/profile.dart';

class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changepage(int index) {
    selectedIndex.value = index;
  }

  List<Widget> get pages => [
    HomePage(),
    FeatPage(),
    ProfilePage(),
  ];
}
