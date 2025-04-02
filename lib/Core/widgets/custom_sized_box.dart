import 'package:flutter/material.dart';

extension IntExtension on int {
  int validate({int value = 0}) {
    return this;
  }

  Widget get SH => SizedBox(
        height: toDouble(),
      );

  Widget get SW => SizedBox(
        width: toDouble(),
      );
}
