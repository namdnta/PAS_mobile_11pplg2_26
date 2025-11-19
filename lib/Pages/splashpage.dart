import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_26/Components/Custom_Colors.dart';
import 'package:pas_mobile_11pplg2_26/Controller/splashscreen_controller.dart';

class SplashscreenPage extends StatefulWidget {
  SplashscreenPage({super.key});
  get controller => Get.find<SplashscreenController>();

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage>
    with TickerProviderStateMixin {
  final splashController = Get.find<SplashscreenController>();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              // App Name
              Text(
                "Next Show!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 10),
              
              // Tagline
              Text(
                "Your TV show companion",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.softCreamLight,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 40),
              
              // Bouncing Dots Loading Indicator
              BouncingDotsIndicator(
                animationController: _animationController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BouncingDotsIndicator extends StatelessWidget {
  final AnimationController animationController;

  const BouncingDotsIndicator({
    Key? key,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            final value = (animationController.value - (index * 0.2)).clamp(0.0, 1.0);
            return Transform.translate(
              offset: Offset(0, -10 * (value < 0.5 ? 2 * value : 2 * (1 - value))),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}