import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Components/Custom_Button.dart';
import 'package:pas_mobile_11pplg2_26/Components/Custom_Colors.dart';
import 'package:pas_mobile_11pplg2_26/Controller/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegisterController>();
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.softCreamDark,
              AppColors.warmBrownDark,
              AppColors.primaryRedLight,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40, bottom: 40),
                  child: Column(
                    children: [
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Text(
                          "Join Next Show! and discover amazing TV shows",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Full Name",
                            prefixIcon: Icon(Icons.person, color: AppColors.primaryRed),
                            labelStyle: TextStyle(color: AppColors.warmBrownDark),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.primaryRed, width: 2),
                            ),
                          ),
                          onChanged: controller.updateFullName,
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email, color: AppColors.primaryRed),
                            labelStyle: TextStyle(color: AppColors.warmBrownDark),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.primaryRed, width: 2),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onChanged: controller.updateEmail,
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: 16),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Username",
                            prefixIcon: Icon(Icons.account_circle, color: AppColors.primaryRed),
                            labelStyle: TextStyle(color: AppColors.warmBrownDark),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.primaryRed, width: 2),
                            ),
                          ),
                          onChanged: controller.updateUsername,
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(bottom: 24),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock, color: AppColors.primaryRed),
                            labelStyle: TextStyle(color: AppColors.warmBrownDark),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.primaryRed, width: 2),
                            ),
                          ),
                          obscureText: true,
                          onChanged: controller.updatePassword,
                        ),
                      ),

                      CustomButton(
                        myText: "Create Account",
                        onPressed: () {
                          controller.register();
                        },
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                color: AppColors.warmBrown,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: AppColors.primaryRed,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
