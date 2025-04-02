import 'package:flutter/material.dart';
import 'package:shipstreem_app/constants.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key, required this.tabs});

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorColor: Colors.white,
        padding: const EdgeInsets.all(4),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: kPrimaryColor, // لون التبويب المحدد 0xFFB0A090
          borderRadius: BorderRadius.circular(12),
        ),
        overlayColor: const MaterialStatePropertyAll(Colors.white),
        labelPadding: EdgeInsets.zero,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey[700],
        labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        tabs: tabs);
  }
}
