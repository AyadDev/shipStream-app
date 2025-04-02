import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';

class CustomEditListTile extends StatelessWidget {
  const CustomEditListTile({super.key, required this.label});

  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          ListTile(
            trailing: const Icon(Icons.edit, color: kPrimaryColor),
            contentPadding: EdgeInsets.zero,
            title: Text(
              label,
              style: Styles.textStyle20.copyWith(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Divider(color: kPrimaryColor, thickness: 2),
        ],
      ),
    );
  }
}
