import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pas_mobile_11pplg2_26/Bindings/dashboard_binding.dart';
import 'package:pas_mobile_11pplg2_26/Bindings/login_Binding.dart';
import 'package:pas_mobile_11pplg2_26/Bindings/register_binding.dart';
import 'package:pas_mobile_11pplg2_26/Bindings/shows_binding.dart';
import 'package:pas_mobile_11pplg2_26/Bindings/splash_binding.dart';
import 'package:pas_mobile_11pplg2_26/Pages/dashboard.dart';
import 'package:pas_mobile_11pplg2_26/Pages/Favoritespage.dart';
import 'package:pas_mobile_11pplg2_26/Pages/loginpage.dart';
import 'package:pas_mobile_11pplg2_26/Pages/profilePage.dart';
import 'package:pas_mobile_11pplg2_26/Pages/registerPage.dart';
import 'package:pas_mobile_11pplg2_26/Pages/showPage.dart';
import 'package:pas_mobile_11pplg2_26/Pages/splashpage.dart';
import 'package:pas_mobile_11pplg2_26/Routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: AppRoutes.registerPage, page: () => RegisterPage(), binding: RegisterBinding()),
    GetPage(name: AppRoutes.splashPage, page: () => SplashscreenPage(), binding: SplashBinding()),
    GetPage(name: AppRoutes.profilePage, page: () => Profilepage()),
    GetPage(name: AppRoutes.dashboardPage, page: () => Dashboardpage(), binding: DashboardBinding()),
    GetPage(name: AppRoutes.showPage, page: () => Showpage(), binding: ShowsBinding()),
    GetPage(name: AppRoutes.favoritePage, page: () => Favoritespage(), binding: ShowsBinding()),
  ];
}