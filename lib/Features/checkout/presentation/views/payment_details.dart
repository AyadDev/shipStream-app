import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/widgets/custom_app_bar.dart';
import '../../../../Core/widgets/custom_navigation_service.dart';
import 'widgets/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(101),
        child: CustomAppBar(
          title: 'Payment',
          onTap: () => Nav.back(),
        ),
      ),
      body: const PaymentDetailsViewBody(),
    );
  }
}
