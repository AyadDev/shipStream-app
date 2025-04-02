import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        SizedBox(
          height: 245,
          width: double.infinity,
          child: Flexible(
            child: FittedBox(
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
          ),
        ),

        SizedBox(
          height: 560,
          width: double.infinity,
          child: Flexible(
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.asset(
                width: 350,
                'assets/images/image_splash1.png',
              ),
            ),
          ),
        ),

        // Container(
        //   height: height * 1,
        //   width: 350,
        // )
        // const Center(
        //   child: Text(
        //     'YeTrack',
        //     style: TextStyle(fontSize: 48),
        //   ),
        // ),
        // const SizedBox(
        //   height: 3,
        // ),
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
    Future.delayed(const Duration(seconds: 1), () {
      // Get.to(
      //   () => const HomeView(),
      //   transition: Transition.fade,
      //   duration: kTransitionDuration,
      // );
      // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //   return const Layout();
      // }));
      Nav.toReplacement(const Layout());
    });
  }
}
