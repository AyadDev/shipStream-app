import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key, this.title = '', this.height = 16});

  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 330,
          height: 150,
          child: Image.asset(
            'assets/images/logo.jpg',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: height),
        Text(title,
            style: Styles.textStyle16z.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            )),
      ],
    );
  }
}
