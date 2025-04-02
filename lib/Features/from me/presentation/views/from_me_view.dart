import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/utils/layout.dart';
import '../../../../Core/widgets/custom_app_bar.dart';
import '../../../../Core/widgets/custom_navigation_service.dart';
import 'widgets/from_me_view_body.dart';

class FromMeView extends StatelessWidget {
  const FromMeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(101),
          child: CustomAppBar(
            title: 'Pichup Order',
            onTap: () => Nav.to(const Layout()),
          )),
      body: FromMeViewBody(),
    );
  }
}
