import 'package:flutter/material.dart';
import 'package:shipstreem_app/constants.dart';

import '../../../../../Core/utils/styles.dart';

/// Widget لعرض ملخص البكجات
class PackageSummary extends StatelessWidget {
  final int totalPieces;
  final double totalWeight;
  const PackageSummary({
    super.key,
    required this.totalPieces,
    required this.totalWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 30, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Number of Pieces',
                style: Styles.textStyle15z.copyWith(color: kPrimaryColor),
              ),
              Text(
                '$totalPieces',
                style: Styles.textStyle15z.copyWith(color: kPrimaryColor),
              ),
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 5, top: 20, bottom: 20, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Weight (Kg)',
                style: Styles.textStyle15z.copyWith(color: kPrimaryColor),
              ),
              Text(
                totalWeight.toStringAsFixed(2),
                style: Styles.textStyle15z.copyWith(color: kPrimaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
