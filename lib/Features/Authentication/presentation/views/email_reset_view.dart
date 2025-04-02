import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/utils/styles.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';

import '../../../../constants.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_help_center.dart';
import 'widgets/custom_logo.dart';

class EmailResetView extends StatelessWidget {
  const EmailResetView({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLogo(title: 'Reset $title'),
                  40.SH,
                  const Column(
                    children: [
                      Text(
                          'Thank you!\n\nPlease check your email for further\ninstructions.\n',
                          textAlign: TextAlign.center,
                          style: Styles.textStyle16z),
                      Text('Didnt get the reset email?\n',
                          style: Styles.textStyle16z),
                    ],
                  ),
                  60.SH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomButton(
                            text: 'Resend',
                            backgroundColor: kPrimaryColor,
                            onPressed: () {}),
                      ),
                      16.SW,
                      Expanded(
                        child: CustomButton(
                          text: 'Cancel',
                          textColor: kPrimaryColor,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  200.SH,
                  const CustomHelpCenter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
