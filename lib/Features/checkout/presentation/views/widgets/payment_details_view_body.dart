import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/utils/styles.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
import 'package:shipstreem_app/Features/checkout/presentation/views/order_submitted_view.dart';
import 'package:shipstreem_app/Features/checkout/presentation/views/widgets/custom_button.dart';
import '../../../../../Core/widgets/custom_navigation_service.dart';
import '../../../../../constants.dart';
import 'custom_credit_card.dart';
import 'package:flutter_svg/svg.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  color: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 0,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: kPrimaryColor.withOpacity(0.5))),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Payment \n Method',
                          style: Styles.textStyle17
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        15.SW,
                        SvgPicture.asset('assets/images/paypal.svg',
                            height: 30),
                        15.SW,
                        SvgPicture.asset('assets/images/master_card.svg',
                            height: 30),
                      ],
                    ),
                  ),
                ),
              ),
              CustomCreditCard(
                autovalidateMode: autovalidateMode,
                formKey: formKey,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
                child: CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      log('payment');
                      setState(() {
                        isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 5));
                      Nav.to(const OrderSubmittedView());
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Payment',
                          textAlign: TextAlign.center,
                          style: Styles.textStyle18,
                        ),
                ),
              )),
        ),
      ],
    );
  }
}
