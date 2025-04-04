import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
import 'package:shipstreem_app/Features/Authentication/presentation/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:shipstreem_app/Features/splash/presentation/views/splash_view.dart';
import '../../../../Core/utils/styles.dart';
import '../../../../Core/utils/validators.dart';
import '../../../../Core/widgets/custom_navigation_service.dart';
import '../../../../Core/widgets/show_snack_bar.dart';
import '../../../../constants.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_contact_dropdown.dart';
import 'widgets/custom_help_center.dart';
import 'widgets/custom_logo.dart';
import 'widgets/custom_text_field.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneCodeController =
      TextEditingController(text: "+967");
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _onSignUpPressed(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      BlocProvider.of<SignUpCubit>(context).signUp(
        username: _usernameController.text.trim(),
        email: _emailController.text.trim(),
        phoneCode: _phoneCodeController.text.trim(),
        phoneNumber: _phoneNumberController.text.trim(),
        password: _passwordController.text,
      );
    }
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignupLoading) {
          isLoading = true;
        } else if (state is SignupSuccess) {
          showSnackBar(context, 'Sign Up Successful!');
          isLoading = false;
          Nav.toReplacement(const SplashView());
        } else if (state is SignupFailure) {
          showSnackBar(context, state.message);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          color: kPrimaryColor.withOpacity(0.4),
          progressIndicator: const CircularProgressIndicator(
            color: kPrimaryColor,
          ),
          inAsyncCall: isLoading,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 32, right: 32, bottom: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomLogo(
                          title: 'Sign Up',
                          height: 0,
                        ),
                        20.SH,
                        Text(
                          'Enter your details to Sign up',
                          textAlign: TextAlign.center,
                          style: Styles.textStyle16z
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        15.SH,
                        Form(
                          key: _formKey,
                          child: SizedBox(
                            height: 625,
                            child: Column(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    label: 'Username',
                                    controller: _usernameController,
                                    keyboardType: TextInputType.name,
                                    validator: validateUsername,
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    label: 'Email Address',
                                    controller: _emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: validateEmail,
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    label: 'Mobile Number',
                                    controller: _phoneNumberController,
                                    prefixIcon: const UstomContactDropdown(),
                                    keyboardType: TextInputType.phone,
                                    validator: validatePhoneCode,
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    label: 'Password',
                                    isPassword: true,
                                    controller: _passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: validatePassword,
                                  ),
                                ),
                                Expanded(
                                  child: CustomTextField(
                                    label: 'Confirm Password',
                                    isPassword: true,
                                    controller: _confirmPasswordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    validator: (value) =>
                                        validateConfirmPassword(
                                            value, _passwordController.text),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, top: 5, right: 8),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        side: const BorderSide(
                                            width: 1, color: kPrimaryColor),
                                        activeColor: kPrimaryColor,
                                        value: state.isTermsAccepted,
                                        onChanged: (val) {
                                          BlocProvider.of<SignUpCubit>(context)
                                              .toggleTermsAgreement();
                                        },
                                      ),
                                      const Text(
                                        'I agree with the terms and conditions',
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 14,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                8.SH,
                                state.isTermsAccepted == true
                                    ? CustomButton(
                                        text: 'Next',
                                        backgroundColor: kPrimaryColor,
                                        onPressed: () =>
                                            _onSignUpPressed(context))
                                    : CustomButton(
                                        text: 'Next',
                                        backgroundColor:
                                            kPrimaryColor.withOpacity(0.4),
                                        onPressed: () =>
                                            _onSignUpPressed(context)),
                              ],
                            ),
                          ),
                        ),
                        20.SH,
                        const CustomHelpCenter(),
                      ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
