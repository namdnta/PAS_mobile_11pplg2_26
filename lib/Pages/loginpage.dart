import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Components/Custom_Button.dart';
import 'package:pas_mobile_11pplg2_26/Components/Custom_Colors.dart';
import 'package:pas_mobile_11pplg2_26/Components/Custom_Text.dart';
// import 'package:pas_mobile_11pplg2_26/Components/Custom_Textfield.dart';
import 'package:pas_mobile_11pplg2_26/Controller/login_controller.dart';

class LoginPage extends StatelessWidget{
 const LoginPage({super.key});

  @override
  Widget build (BuildContext context){
  final loginController = Get.find<LoginController>();

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
              onChanged: loginController.updateUsername,
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
              onChanged: loginController.updatePassword,
            ),
            ),

          CustomButton(myText: 'Login', 
          onPressed: () {
            loginController.login();
          }),
          
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/register');
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ],
        ),
      )
    );
  }
}