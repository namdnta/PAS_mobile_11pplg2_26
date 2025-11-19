import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Controller/show_controller.dart';


class ShowsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ShowController());
  }
}