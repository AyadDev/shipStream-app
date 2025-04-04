import 'package:flutter/material.dart';
import 'package:shipstreem_app/constants.dart';
import '../../../../../Core/utils/layout.dart';
import '../../../../../Core/widgets/custom_navigation_service.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            color: kPrimaryColor,
            child: Stack(
              children: [
                Positioned(
                  left: 16, // 29.86
                  top: 0,
                  child: Container(
                    width: 351.27,
                    height: 280.25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/logo.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  left: 88,
                  top: 179, // 199
                  child: SizedBox(
                    width: 330,
                    height: 56,
                    child: Text(
                      'Your Logistics Partner for Seamless Delivery ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Expanded(
          flex: 2,
          child: SizedBox(
            width: double.infinity,
            child: Flexible(
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(
                  width: 350,
                  'assets/images/image_splash1.png',
                ),
              ),
            ),
          ),
        ),

        // SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      Nav.toReplacement(const Layout());
    });
  }
}
