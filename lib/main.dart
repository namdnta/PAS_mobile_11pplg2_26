import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_26/Routes/Pages.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splashPage,
    );
  }
}

