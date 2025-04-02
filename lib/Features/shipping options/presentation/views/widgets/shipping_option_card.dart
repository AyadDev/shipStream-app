import 'package:flutter/material.dart';
import 'package:shipstreem_app/constants.dart';

///
class ShippingOptionCard extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final String deliveryTime;
  final bool isSelected;

  const ShippingOptionCard({
    super.key,
    required this.title,
    required this.price,
    required this.deliveryTime,
    required this.isSelected,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardColor =
        isSelected ? kPrimaryColor.withOpacity(0.5) : const Color(0xFFEAE7E2);

    return Container(
      width: 166,
      height: 197,
      decoration: ShapeDecoration(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[900],
              fontSize: 14,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              height: 1.57,
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 26),
          Image.asset(image),
          const SizedBox(height: 20),
          Text(
            price,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            deliveryTime,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
