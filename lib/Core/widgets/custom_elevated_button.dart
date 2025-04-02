import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required GlobalKey<FormState> formKey,
    this.color = Colors.white,
    this.radius = 12,
    this.height = 70,
    required this.title,
    this.width = double.infinity,
    this.onPressed,
  });
  final Color? color;
  final double radius;
  final double? height;
  final double width;
  final Widget title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: color,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: title,
      ),
    );
  }
}
