import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
import 'package:shipstreem_app/constants.dart';
import 'OTP_view.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_help_center.dart';
import 'widgets/custom_logo.dart';
import 'widgets/custom_text_field.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
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
                  const CustomLogo(),
                  40.SH,
                  _errorMessage == null
                      ? const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(''),
                        )
                      : Text(
                          _errorMessage!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  20.SH,
                  CustomTextField(
                    label: 'Enter New Password',
                    isPassword: true,
                    controller: _newPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  20.SH,
                  CustomTextField(
                    label: 'Confirm Password',
                    isPassword: true,
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  40.SH,
                  CustomButton(
                      text: 'Submit',
                      backgroundColor: kPrimaryColor,
                      onPressed: _validateAndNewPassword),
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

  void _validateAndNewPassword() {
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    // التحقق من الحقول الفارغة
    if (newPassword.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        _errorMessage =
            'Invalid new Password and / or confirm Password\nPlease try again';
      });
      return;
    } else if (newPassword == confirmPassword) {
      // نجاح
      Navigator.push(
        context,
        MaterialPageRoute(builder: (builder) {
          return const OTPView();
        }),
      );
      setState(() {
        _newPasswordController.clear();
        _confirmPasswordController.clear();
      });
    } else {
      // خطأ
      setState(() {
        _errorMessage = 'Error You didn\'t write the password correctly\n';
      });
    }
  }
}
