import 'package:get/get.dart';
import 'package:record_route/pages/home/home_binding.dart';
import 'package:record_route/pages/home/home_page.dart';
import 'package:record_route/pages/login/login_page.dart';
import 'package:record_route/pages/login/login_binding.dart';
import 'package:record_route/pages/router/router_page.dart';
import 'package:record_route/pages/router_detail/router_detail_binding.dart';
import 'package:record_route/pages/router/router_binding.dart';
import 'package:record_route/pages/router_detail/router_detail_page.dart';
import 'package:record_route/pages/router_form/router_form_binding.dart';
import 'package:record_route/pages/router_form/router_form_page.dart';
import 'package:record_route/pages/splash/splash_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.router,
      page: () => const RouterPage(),
      binding: RouterBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.routerForm,
      page: () => const RouterFormPage(),
      binding: RouterFormBinding(),
      transition: Transition.topLevel,
    ),
    GetPage(
      name: Routes.routerDetail,
      page: () => const RouterDetailPage(),
      binding: RouterDetailBinding(),
      transition: Transition.leftToRight,
    ),
  ];
}
