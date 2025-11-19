import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Controller/dashboard_controller.dart';

class Dashboardpage extends StatelessWidget {
  Dashboardpage({super.key});

  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: dashboardController.pages[dashboardController.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: dashboardController.selectedIndex.value,
        onTap: dashboardController.changePage,
        items: [
          BottomNavigationBarItem(label: 'Shows', icon: Icon(Icons.tv),),
          BottomNavigationBarItem(icon: Icon(Icons.favorite) , label: 'Favorites',),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile',),
        ],
      ),
    ));
  }
  
}