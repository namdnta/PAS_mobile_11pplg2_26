import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Components/Custom_Button.dart';
import 'package:pas_mobile_11pplg2_26/Components/Custom_Colors.dart';
import 'package:pas_mobile_11pplg2_26/Components/Custom_Text.dart';
// import 'package:pas_mobile_11pplg2_26/Components/Custom_Textfield.dart';
import 'package:pas_mobile_11pplg2_26/Controller/auth_controller.dart';

class Loginpage extends StatelessWidget{
 const Loginpage({super.key});

  @override
  Widget build (BuildContext context){
  final authController = Get.find<AuthController>();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.softCreamDark,
              AppColors.warmBrownDark,
              AppColors.primaryRedLight,
            ],
          ),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              margin: const EdgeInsets.only(bottom: 32.0),
            child: CustomText(text: "Next Show!", 
            color: const Color.fromARGB(255, 255, 255, 255), 
            fontSize: 50, 
            fontWeight: FontWeight.bold, 
            textAlign: TextAlign.center,
            ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                fillColor: AppColors. softCreamLight,
                filled: true,
              ),
              onChanged: authController.updateUsername,
            ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                fillColor: AppColors. softCreamLight,
                filled: true,
              ),
              obscureText: true,
              onChanged: authController.updatePassword,
            ),
            ),

          CustomButton(myText: 'Login', 
          onPressed: () {
            authController.login();
          } )
          ],
        ),
      )
    );
  }
}