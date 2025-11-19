import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_26/Routes/Pages.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Routes/routes.dart';
import 'package:pas_mobile_11pplg2_26/Bindings/initial_binding.dart';
import 'package:pas_mobile_11pplg2_26/Components/Custom_Colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Next Show!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFD34E4E, {
          50: AppColors.primaryRedLight,
          100: AppColors.primaryRedLight,
          200: AppColors.primaryRedLight,
          300: AppColors.primaryRed,
          400: AppColors.primaryRed,
          500: AppColors.primaryRed,
          600: AppColors.primaryRedDark,
          700: AppColors.primaryRedDark,
          800: AppColors.primaryRedDark,
          900: AppColors.primaryRedDark,
        }),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryRed,
          primary: AppColors.primaryRed,
          secondary: AppColors.goldBrown,
          background: AppColors.softCreamLight,
          surface: Colors.white,
        ),
        fontFamily: 'System',
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primaryRed,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryRed,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.warmBrown),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primaryRed, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.goldBrown),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryRed,
          unselectedItemColor: AppColors.warmBrown,
          type: BottomNavigationBarType.fixed,
          elevation: 8,
        ),
      ),
      initialBinding: InitialBinding(),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splashPage,
    );
  }
}

