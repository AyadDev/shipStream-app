import 'package:flutter/material.dart';
import 'package:shipstreem_app/constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.title, this.height = 101, this.onTap});
  final String title;
  final double height;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        // color: Color(0xFFB0A090),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(9),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            GestureDetector(
                onTap: onTap,
                child: const Icon(Icons.arrow_back,
                    color: Colors.white, size: 24)),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
