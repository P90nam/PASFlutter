import 'package:get/get.dart';

import '../pages/login_page.dart';
import '../pages/menu_drawer_page.dart';
import '../pages/transaction_page.dart';
import 'menu/home.dart';
import 'menu/profile.dart';
import 'menu/feat.dart';


class Routes {
  static const String home = '/home';
  static const String feat = '/feat';
  static const String profile = '/profile';
  static const String login = '/login';
  static const String transaction = '/transaction';
  static const String menuDrawer = '/menuDrawer';

  static List<GetPage> myPages() {
    return [
      GetPage(name: home, page: () => HomePage()),
      GetPage(name: login, page: () => LoginPage()),
      GetPage(name: menuDrawer, page: () => MenuDrawerPage()),
      GetPage(name: profile, page: () => ProfilePage()),
      GetPage(name: feat, page: () => FeatPage()),
      GetPage(name: transaction, page: () => TransactionPage()),
    ];
  }

}
