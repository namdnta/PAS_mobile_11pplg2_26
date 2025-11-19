import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Controller/dashboard_controller.dart';
import 'package:pas_mobile_11pplg2_26/Components/Custom_Colors.dart';

class Dashboardpage extends StatelessWidget {
  Dashboardpage({super.key});

  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print('📱 Dashboard UI rebuilding with selectedIndex: ${dashboardController.selectedIndex.value}');
      return Scaffold(
        body: dashboardController.pages[dashboardController.selectedIndex.value],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryRed.withOpacity(0.9),
              AppColors.primaryRedDark,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: dashboardController.selectedIndex.value,
          onTap: dashboardController.changePage,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: AppColors.softCreamLight.withOpacity(0.7),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 11,
          ),
          items: [
            BottomNavigationBarItem(
              label: 'Shows', 
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: dashboardController.selectedIndex.value == 0 
                    ? AppColors.goldBrown.withOpacity(0.3)
                    : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.tv),
              ),
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: dashboardController.selectedIndex.value == 1 
                    ? AppColors.goldBrown.withOpacity(0.3)
                    : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.favorite),
              ), 
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: dashboardController.selectedIndex.value == 2 
                    ? AppColors.goldBrown.withOpacity(0.3)
                    : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.person),
              ), 
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
    });
  }
  
}