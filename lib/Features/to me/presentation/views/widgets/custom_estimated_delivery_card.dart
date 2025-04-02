import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/utils/styles.dart';

class EstimatedDeliveryCard extends StatelessWidget {
  const EstimatedDeliveryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 62,
      decoration: ShapeDecoration(
        color: const Color(0xFFF7F7F7),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFA3968E)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Text(
            'Estimated  delivery',
            style: Styles.textStyle20.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '16 Nov 2024 ',
            style: Styles.textStyle20.copyWith(
              color: const Color(0xCC575757),
            ),
          ),
        ],
      ),
    );
  }
}
