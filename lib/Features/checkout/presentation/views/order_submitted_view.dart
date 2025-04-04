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
          SizedBox(
            width: 323,
            height: 108,
            child: Text(
              'Thanks for choosing ShipStream We are  Processing Your Order, You wil receive the Tracking Details Soon.',
              textAlign: TextAlign.center,
              style: Styles.textStyle17.copyWith(
                  fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),
            ),
          ),
        ],
      ),
    );
  }
}
