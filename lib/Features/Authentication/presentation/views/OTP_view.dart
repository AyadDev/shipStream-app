import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
import '../../../../Core/utils/styles.dart';
import 'email_reset_view.dart';
import 'widgets/Custom_oTP_text_field.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_help_center.dart';
import 'widgets/custom_logo.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key});

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final _otpControllers = List.generate(4, (index) => TextEditingController());

  String? _errorMessage;

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
                  const CustomLogo(
                    title: 'Enter OTP',
                  ),
                  8.SH,
                  Text(
                    'An OTP has been sent to\n+967 774 073 842',
                    style: Styles.textStyle16z.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  24.SH,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return CustomOTPTextField(
                        controller: _otpControllers[index],
                        autoFocus: index == 0,
                        onChanged: (value) {
                          if (value.isNotEmpty && index < 3) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      );
                    }),
                  ),
                  20.SH,
                  _errorMessage == null
                      ? const Text('')
                      : Column(
                          children: [
                            Text(_errorMessage!,
                                textAlign: TextAlign.center,
                                style: Styles.textStyle16z),
                            Text('Ruqest again',
                                textAlign: TextAlign.center,
                                style: Styles.textStyle16z
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ],
                        ),
                  40.SH,
                  CustomButton(
                    text: 'Submit',
                    backgroundColor: const Color(0xFFA3968E),
                    onPressed: _submitOTP,
                  ),
                  190.SH,
                  const CustomHelpCenter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitOTP() {
    final otpCode = _otpControllers.map((controller) => controller.text).join();
    print('OTP Code: $otpCode');

    if (otpCode.isEmpty) {
      setState(() {
        _errorMessage = 'Didnt get code?';
      });
      return;
    } else if (otpCode == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (builder) {
          return const EmailResetView(title: 'Password');
        }),
      );
    } else {
      setState(() {
        _errorMessage = 'Incalid OTP';
      });
    }
  }
}
