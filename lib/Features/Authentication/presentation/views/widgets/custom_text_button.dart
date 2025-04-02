import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final Function() onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onPressed,
        child: Text(
          title,
          style: Styles.textStyle16z,
        ),
      ),
    );
  }
}
