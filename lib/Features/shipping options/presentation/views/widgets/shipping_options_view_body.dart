import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shipstreem_app/constants.dart';

import '../../../../../Core/utils/styles.dart';

import '../../../../../Core/widgets/custom_elevated_button.dart';
import '../../../../../Core/widgets/custom_navigation_service.dart';
import '../../../../checkout/presentation/views/payment_details.dart';
import '../../../../from me/presentation/views/widgets/process_button.dart';
import 'shipping_option_card.dart';

class ToMeViewBody extends StatefulWidget {
  ToMeViewBody({
    super.key,
  });

  @override
  State<ToMeViewBody> createState() => _ToMeViewBodyState();
}

class _ToMeViewBodyState extends State<ToMeViewBody> {
  final _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Type of Shipping ',
            style: Styles.textStyle15.copyWith(
              color: kPrimaryColor,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: ShippingOptionCard(
                  title: 'Standard Shipping',
                  price: '\$132.60',
                  deliveryTime: 'Within 2 months',
                  isSelected: selectedIndex == 0,
                  image: 'assets/images/Vector.png',
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: ShippingOptionCard(
                  title: 'Fast Shipping',
                  price: '\$123.60',
                  deliveryTime: 'Within 2 weeks',
                  isSelected: selectedIndex == 1,
                  image: 'assets/images/Vector2.png',
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: CustomElevatedButton(
                radius: 15,
                height: 70,
                width: double.infinity,
                color: kPrimaryColor,
                formKey: _formKey,
                title: _isSubmitting
                    ? const Center(
                        child: CircularProgressIndicator(color: Colors.white))
                    : Text('Move to Payment',
                        style: Styles.textStyle16
                            .copyWith(fontWeight: FontWeight.w900)),
                onPressed: () async {
                  setState(() {
                    _isSubmitting = true;
                  });
                  await Future.delayed(const Duration(seconds: 5));
                  setState(() {
                    _isSubmitting = false;
                  });
                  Nav.to(const PaymentDetailsView());
                }),
          ),
        ],
      ),
    );
  }
}
