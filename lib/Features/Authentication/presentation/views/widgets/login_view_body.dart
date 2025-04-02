// import 'package:flutter/material.dart';
// import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
// import 'package:shipstreem_app/Features/splash/presentation/views/splash_view.dart';
// import 'package:shipstreem_app/constants.dart';
// import '../../../../../Core/utils/styles.dart';
// import '../../../../../Core/widgets/custom_navigation_service.dart';
// import '../forgot_password_view.dart';
// import '../forgot_username_view.dart';
// import '../sign_up_view.dart';
// import 'custom_button.dart';
// import 'custom_help_center.dart';
// import 'custom_logo.dart';
// import 'custom_text_button.dart';
// import 'custom_text_field.dart';

// class LoginViewBody extends StatefulWidget {
//   const LoginViewBody({
//     super.key,
//   });

//   @override
//   State<LoginViewBody> createState() => _LoginViewBodyState();
// }

// class _LoginViewBodyState extends State<LoginViewBody> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   String? _errorMessage;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 32, right: 32, bottom: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const CustomLogo(
//                 title: 'Login',
//               ),
//               35.SH,
//               _errorMessage == null
//                   ? Text(
//                       'Enter your username and password \nto login',
//                       textAlign: TextAlign.center,
//                       style: Styles.textStyle16z
//                           .copyWith(fontWeight: FontWeight.w700),
//                     )
//                   : Text(
//                       _errorMessage!,
//                       textAlign: TextAlign.center,
//                       style: const TextStyle(
//                         color: Colors.red,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//               8.SH,
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   CustomTextField(
//                     label: 'Username',
//                     controller: _usernameController,
//                     keyboardType: TextInputType.name,
//                   ),
//                   CustomTextButton(
//                       title: 'Forgot Username?',
//                       onPressed: () {
//                         Nav.to(ForgotNameView());
//                         setState(() {
//                           _usernameController.clear();
//                           _passwordController.clear();
//                         });
//                       }),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   CustomTextField(
//                     label: 'Password',
//                     isPassword: true,
//                     controller: _passwordController,
//                     keyboardType: TextInputType.visiblePassword,
//                   ),
//                   CustomTextButton(
//                       title: 'Forgot Password?',
//                       onPressed: () {
//                         Nav.to(ForgotPasswordView());
//                         setState(() {
//                           _usernameController.clear();
//                           _passwordController.clear();
//                         });
//                       }),
//                 ],
//               ),
//               CustomButton(
//                   text: 'Login',
//                   backgroundColor: kPrimaryColor,
//                   onPressed: _validateAndLogin),
//               20.SH,
//               const Row(
//                 children: [
//                   Expanded(
//                     child: Divider(
//                       color: Colors.grey,
//                       thickness: 1,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Or login in with',
//                       style: TextStyle(
//                         color: Colors.black54,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Divider(
//                       color: Colors.grey,
//                       thickness: 1,
//                     ),
//                   ),
//                 ],
//               ),
//               20.SH,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: CustomButton(
//                       text: 'Google',
//                       backgroundColor: Colors.white,
//                       textColor: kPrimaryColor,
//                       onPressed: () {},
//                     ),
//                   ),
//                   20.SH,
//                   Expanded(
//                     child: CustomButton(
//                       text: 'Facebook',
//                       backgroundColor: kPrimaryColor,
//                       onPressed: () {},
//                     ),
//                   ),
//                 ],
//               ),
//               20.SH,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Don't have an account?",
//                     style: Styles.textStyle16z
//                         .copyWith(fontWeight: FontWeight.w700),
//                   ),
//                   5.SW,
//                   GestureDetector(
//                     onTap: () {
//                       Nav.to(const SignUpView());
//                       setState(() {
//                         _usernameController.clear();
//                         _passwordController.clear();
//                       });
//                     },
//                     child: Text(
//                       'Register',
//                       style: Styles.textStyle16z
//                           .copyWith(fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                 ],
//               ),
//               30.SH,
//               const CustomHelpCenter(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _validateAndLogin() {
//     final username = _usernameController.text.trim();
//     final password = _passwordController.text.trim();

//     if (username.isEmpty || password.isEmpty) {
//       setState(() {
//         _errorMessage = 'Invalid username and / or password\nPlease try again';
//       });
//       return;
//     } else if (username == 'admin' && password == '1234') {
//       Nav.toReplacement(const SplashView());
//     } else {
//       setState(() {
//         _errorMessage = 'Username or password  incorrect\n';
//       });
//     }
//     setState(() {
//       _usernameController.clear();
//       _passwordController.clear();
//     });
//   }
// }
