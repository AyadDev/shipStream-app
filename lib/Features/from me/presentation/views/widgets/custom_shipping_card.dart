import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipstreem_app/Features/from%20me/presentation/view_model/address_cubit/address_cubit.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';
import 'custom_shipping_Input.dart';
import 'shipping_methods_bottom_sheet.dart';

class CustomShippingCard extends StatelessWidget {
  const CustomShippingCard({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFA3968E)),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x4C91C9FD),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Shipping from",
              style: Styles.textStyle17.copyWith(fontSize: 16),
            ),
          ),
          CustomShippingInput(
            controller: controller,
            hintText: 'Tap here to add a pickup location',
            label: 'pickup location',
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => AddressCubit(),
                      child: const ShippingMethodsBottomSheet(
                        title: 'Pickup from',
                      ),
                    );
                  });
            },
          ),
          const Divider(height: 2, color: kPrimaryColor),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Shipping to",
              style: Styles.textStyle17.copyWith(fontSize: 16),
            ),
          ),
          CustomShippingInput(
            controller: controller,
            hintText: 'Tap here to add the destination',
            label: 'destination',
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return const ShippingMethodsBottomSheet(
                      title: 'Ship to',
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
