import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Core/widgets/custom_navigation_service.dart';
import '../../../notifications/presentation/views/notifications_screen.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                Nav.to(const NotificationsView());
              },
              child: SvgPicture.asset(
                'assets/icons/icon_notifications_.svg',
              ),
            ),
          )
        ],
        title: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
        ),
        backgroundColor: const Color(0xffB8B2AE),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: const CustomDrawer(),
      body: HomeViewBody(),
    );
  }
}
