import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
import 'email_reset_view.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_help_center.dart';
import 'widgets/custom_logo.dart';
import 'widgets/custom_text_field.dart';

class NewUsernameView extends StatefulWidget {
  const NewUsernameView({super.key});

  @override
  State<NewUsernameView> createState() => _NewUsernameViewState();
}

class _NewUsernameViewState extends State<NewUsernameView> {
  final TextEditingController _newUsernameController = TextEditingController();
  final TextEditingController _confirmUsernameController =
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
                    label: 'Enter New Username',
                    controller: _newUsernameController,
                    keyboardType: TextInputType.name,
                  ),
                  20.SH,
                  CustomTextField(
                    label: 'Confirm Username',
                    isPassword: true,
                    controller: _confirmUsernameController,
                    keyboardType: TextInputType.name,
                  ),
                  40.SH,
                  CustomButton(
                      text: 'Submit',
                      backgroundColor: const Color(0xFFA3968E),
                      onPressed: _validateAndNewUserName),
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

  void _validateAndNewUserName() {
    final newUsername = _newUsernameController.text.trim();
    final confirmUsername = _confirmUsernameController.text.trim();

    // التحقق من الحقول الفارغة
    if (newUsername.isEmpty || confirmUsername.isEmpty) {
      setState(() {
        _errorMessage =
            'Invalid new username and / or confirm username\nPlease try again';
      });
      return;
    }

    // مثال بسيط للتحقق
    else if (newUsername == confirmUsername) {
      // نجاح
      Navigator.push(
        context,
        MaterialPageRoute(builder: (builder) {
          return const EmailResetView(title: 'Username');
        }),
      );
      setState(() {
        _newUsernameController.clear();
        _confirmUsernameController.clear();
      });
    } else {
      // خطأ
      setState(() {
        _errorMessage = 'Error You didn\'t write the username correctly\n';
      });
    }
  }
}
