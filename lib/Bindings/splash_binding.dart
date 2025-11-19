import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Controller/splashscreen_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }

}