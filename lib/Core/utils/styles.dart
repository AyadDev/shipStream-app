import 'package:flutter/material.dart';

import '../../constants.dart';

abstract class Styles {
  static const textStyle11 = TextStyle(
    color: kPrimaryColor,
    fontSize: 11,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w500,
  );
  static const textStyle16 = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    height: 1.38,
  );
  static const textStyle16z = TextStyle(
    color: kPrimaryColor,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  static const textStyle15 = TextStyle(
    color: Color(0xFF1D1B20),
    fontSize: 15,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 1.50,
    letterSpacing: 0.50,
  );

  static const textStyle15z = TextStyle(
    color: Color(0xCCA3968E),
    fontSize: 15,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 1.47,
    letterSpacing: -0.43,
  );

  static const textStyle18 = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
  );

  static const textStyle12 = TextStyle(
    fontFamily: 'poppins',
    fontSize: 12,
    color: Colors.grey,
    fontWeight: FontWeight.bold,
  );
  static const textStyle13 = TextStyle(
    color: kPrimaryColor,
    fontSize: 13,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.40,
  );

  static const textStyle10 = TextStyle(
    fontFamily: 'poppins',
    fontSize: 10,
    color: Color(0xff909090),
    fontWeight: FontWeight.w400,
  );
  static const textStyle14 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    color: Color(0xFF0082D2),
    fontWeight: FontWeight.bold,
  );

  static const textStyle20 = TextStyle(
    color: kPrimaryColor,
    fontSize: 20,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
  );
  static const textStyle17 = TextStyle(
    color: Color(0xFF575757),
    fontSize: 17,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    height: 1.29,
    letterSpacing: -0.43,
  );
  static const textStyle30 = TextStyle(
    color: kPrimaryColor,
    fontSize: 30,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 0.69,
  );

  static final InputDecoration inputDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
