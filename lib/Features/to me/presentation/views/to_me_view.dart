import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/utils/layout.dart';
import '../../../../Core/widgets/custom_app_bar.dart';
import '../../../../Core/widgets/custom_navigation_service.dart';
import 'widgets/to_me_view_body.dart';

class ToMeView extends StatelessWidget {
  const ToMeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(101),
        child: CustomAppBar(
          title: 'To Me',
          onTap: () => Nav.to(const Layout()),
        ),
      ),
      body: ToMeViewBody(),
    );
  }
}
