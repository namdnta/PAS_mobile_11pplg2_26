import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Controller/auth_controller.dart';
import 'package:pas_mobile_11pplg2_26/Pages/Favoritespage.dart';
import 'package:pas_mobile_11pplg2_26/Pages/profilePage.dart';
import 'package:pas_mobile_11pplg2_26/Pages/showPage.dart';


class DashboardController extends GetxController{

  final AuthController authController = Get.find<AuthController>(); 

  var selectedIndex = 0.obs;

  // Create pages lazily to avoid circular reference
  List<Widget> get pages => [
    Showpage(onNavigateToFavorites: () => changePage(1)),
    Favoritespage(),
    Profilepage(),
  ];

  void changePage(int index){
    print('🔄 DashboardController.changePage called with index: $index');
    print('📍 Previous selectedIndex: ${selectedIndex.value}');
    selectedIndex.value = index;
    print('✅ New selectedIndex: ${selectedIndex.value}');
  }
}