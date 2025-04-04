import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
import 'package:shipstreem_app/Features/Authentication/presentation/view_models/password_cubit/forgot_password_cubit.dart';
import 'package:shipstreem_app/constants.dart';
import '../../../../Core/utils/styles.dart';
import '../../../../Core/widgets/custom_navigation_service.dart';
import '../../../../Core/widgets/show_snack_bar.dart';
import '../view_models/auth_repository.dart';
import '../view_models/login_cubit/login_cubit.dart';
import 'login_view.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_contact_dropdown.dart';
import 'widgets/custom_help_center.dart';
import 'widgets/custom_logo.dart';
import 'widgets/custom_text_field.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNamberController = TextEditingController();
  String? _errorMessage;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordLoading) {
          isLoading = true;
        } else if (state is ForgotPasswordSuccess) {
          showSnackBar(context, state.message);
          Nav.toReplacement(BlocProvider(
            create: (context) => LoginCubit(authRepository: AuthRepository()),
            child: LoginView(),
          ));
        } else if (state is ForgotPasswordFailure) {
          _errorMessage = state.message;
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          color: kPrimaryColor.withOpacity(0.4),
          progressIndicator: const CircularProgressIndicator(
            color: kPrimaryColor,
          ),
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 32, right: 32, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomLogo(title: 'Forgot Password'),
                        40.SH,
                        _errorMessage == null
                            ? Text(
                                'Reset using phone or email \n',
                                textAlign: TextAlign.center,
                                style: Styles.textStyle16z.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
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
                          label: 'Email Address',
                          controller: _emailAddressController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        16.SH,
                        Text(
                          'OR',
                          style: Styles.textStyle16z.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        16.SH,
                        CustomTextField(
                          label: 'Phone Number',
                          isPassword: true,
                          controller: _phoneNamberController,
                          keyboardType: TextInputType.phone,
                          prefixIcon: const UstomContactDropdown(),
                        ),
                        60.SH,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomButton(
                                  text: 'Submit',
                                  backgroundColor: kPrimaryColor,
                                  onPressed: () {
                                    context
                                        .read<ForgotPasswordCubit>()
                                        .forgotPassword(
                                          email: _emailAddressController.text
                                              .trim(),
                                          phone: _phoneNamberController.text
                                              .trim(),
                                        );
                                    setState(() {
                                      _emailAddressController.clear();
                                      _phoneNamberController.clear();
                                    });
                                  }),
                            ),
                            16.SW,
                            Expanded(
                              child: CustomButton(
                                text: 'Cancel',
                                backgroundColor: Colors.white,
                                textColor: kPrimaryColor,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                        128.SH,
                        const CustomHelpCenter(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // void _validateAndForgotPassword() {
  //   final emailAddress = _emailAddressController.text.trim();
  //   final phoneMobile = _phoneNamberController.text.trim();

  //   if (emailAddress.isEmpty && phoneMobile.isEmpty) {
  //     setState(() {
  //       _errorMessage =
  //           'Invalid email address and / or phone number\nPlease try again';
  //     });
  //     return;
  //   } else if (emailAddress == 'eyaddev@gmail.com' ||
  //       phoneMobile == '774677404') {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (builder) {
  //         return const NewPasswordView();
  //       }),
  //     );
  //   } else {
  //     setState(() {
  //       _errorMessage = 'Email or phone number is incorrect\n';
  //     });
  //   }
  // }
}
