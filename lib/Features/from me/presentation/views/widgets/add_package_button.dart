import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles.dart';

/// Widget لزر إضافة باكج جديد
class AddPackageButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddPackageButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFFA3968E),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: InkWell(
            onTap: onPressed,
            child: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          'Add Package',
          style: Styles.textStyle15z.copyWith(color: const Color(0xFFA3968E)),
        ),
      ],
    );
  }
}
