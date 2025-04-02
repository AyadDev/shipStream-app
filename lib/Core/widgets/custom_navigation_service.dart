import 'package:flutter/material.dart';

class Nav {
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  static Future<T?> to<T>(Widget page) =>
      key.currentState!.push(MaterialPageRoute(builder: (_) => page));

  static Future<T?> toAndRemoveUntil<T>(Widget page) =>
      key.currentState!.pushAndRemoveUntil<T>(
        MaterialPageRoute(builder: (_) => page),
        (route) => false,
      );

  static Future<T?> toReplacement<T>(Widget page) =>
      key.currentState!.pushReplacement(
        MaterialPageRoute(
            builder: (_) =>
                // ignore: deprecated_member_use
                WillPopScope(onWillPop: () async => false, child: page)),
      );

  static void back<T>([T? result]) => key.currentState!.pop<T>(result);
}
