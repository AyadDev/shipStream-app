import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/widgets/custom_navigation_service.dart';
import '../../../../Core/widgets/custom_app_bar.dart';
import 'widgets/shipping_options_view_body.dart';

class ShippingOptionsView extends StatelessWidget {
  const ShippingOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(101),
          child:
              CustomAppBar(title: 'Shipping Options', onTap: () => Nav.back())),
      body: const ToMeViewBody(),
    );
  }
}
