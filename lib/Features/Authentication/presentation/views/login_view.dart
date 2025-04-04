import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
import 'package:shipstreem_app/Features/Authentication/presentation/view_models/forgot_username_cubit/forgot_username_cubit.dart';
import 'package:shipstreem_app/Features/Authentication/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:shipstreem_app/Features/Authentication/presentation/view_models/password_cubit/forgot_password_cubit.dart';
import '../../../../Core/utils/styles.dart';
import '../../../../Core/widgets/custom_navigation_service.dart';
import '../../../../constants.dart';
import '../../../splash/presentation/views/splash_view.dart';
import '../view_models/auth_repository.dart';
import '../view_models/sign_up_cubit/sign_up_cubit.dart';
import 'forgot_password_view.dart';
import 'forgot_username_view.dart';
import 'sign_up_view.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_help_center.dart';
import 'widgets/custom_logo.dart';
import 'widgets/custom_text_button.dart';
import 'widgets/custom_text_field.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  String? _errorMessage;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          _errorMessage = state.message;
          isLoading = false;
        } else if (state is LoginSuccess) {
          Nav.toReplacement(const SplashView());
          isLoading = false;
        } else if (state is LoginLoading) {
          isLoading = true;
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
                        title: 'Login',
                      ),
                      35.SH,
                      _errorMessage == null
                          ? Text(
                              'Enter your username and password \nto login',
                              textAlign: TextAlign.center,
                              style: Styles.textStyle16z
                                  .copyWith(fontWeight: FontWeight.w700),
                            )
                          : Text(
                              _errorMessage!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      8.SH,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomTextField(
                            label: 'Username',
                            controller: _usernameController,
                            keyboardType: TextInputType.name,
                          ),
                          CustomTextButton(
                              title: 'Forgot Username?',
                              onPressed: () {
                                Nav.to(BlocProvider(
                                  create: (context) => ForgotUsernameCubit(
                                      authRepository: AuthRepository()),
                                  child: const ForgotNameView(),
                                ));
                              }),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomTextField(
                            label: 'Password',
                            isPassword: true,
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          CustomTextButton(
                              title: 'Forgot Password?',
                              onPressed: () {
                                Nav.to(BlocProvider(
                                  create: (context) => ForgotPasswordCubit(
                                      authRepository: AuthRepository()),
                                  child: const ForgotPasswordView(),
                                ));
                              }),
                        ],
                      ),
                      CustomButton(
                          text: 'Login',
                          backgroundColor: kPrimaryColor,
                          onPressed: () {
                            BlocProvider.of<LoginCubit>(context).login(
                              username: _usernameController.text,
                              password: _passwordController.text,
                            );
                          }),
                      20.SH,
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Or login in with',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      20.SH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomButton(
                              text: 'Google',
                              backgroundColor: Colors.white,
                              textColor: kPrimaryColor,
                              onPressed: () {},
                            ),
                          ),
                          20.SW,
                          Expanded(
                            child: CustomButton(
                              text: 'Facebook',
                              backgroundColor: kPrimaryColor,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      20.SH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: Styles.textStyle16z
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          5.SW,
                          GestureDetector(
                            onTap: () {
                              Nav.to(BlocProvider<SignUpCubit>(
                                create: (context) => SignUpCubit(
                                    authRepository: AuthRepository()),
                                child: SignUpView(),
                              ));
                            },
                            child: Text(
                              'Register',
                              style: Styles.textStyle16z
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      30.SH,
                      const CustomHelpCenter(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
