import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/utils/styles.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
import '../../../../Core/widgets/custom_app_bar.dart';
import '../../../../Core/widgets/custom_navigation_service.dart';
import '../../../from me/presentation/views/from_me_view.dart';
import 'widgets/custom_check_icon.dart';

class OrderSubmittedView extends StatelessWidget {
  const OrderSubmittedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(101),
        child: CustomAppBar(
          title: 'Order Submitted',
          onTap: () => Nav.to(const FromMeView()),
        ),
      ),
      body: Column(
        children: [
          90.SH,
          const CustomCheckIcon(),
          120.SH,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Thanks for choosing ShipStream \n  We are Processing Your Order, \n You wil receive Tracking \n Details Soon.',
              maxLines: 6,
              textAlign: TextAlign.center,
              style: Styles.textStyle17.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
