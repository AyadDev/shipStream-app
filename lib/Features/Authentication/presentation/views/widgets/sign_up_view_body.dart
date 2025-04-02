// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
// import 'package:shipstreem_app/constants.dart';
// import '../../../../../Core/utils/styles.dart';
// import '../login_view.dart';
// import 'custom_button.dart';
// import 'custom_contact_dropdown.dart';
// import 'custom_help_center.dart';
// import 'custom_logo.dart';
// import 'custom_text_field.dart';

// class SignUpViewBody extends StatefulWidget {
//   const SignUpViewBody({super.key});

//   @override
//   State<SignUpViewBody> createState() => _SignUpViewBodyState();
// }

// class _SignUpViewBodyState extends State<SignUpViewBody> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _mobileNumberController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   bool? checValue = false;

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
//                 title: 'Sign Up',
//                 height: 0,
//               ),
//               20.SH,
//               Text(
//                 'Enter your details to Sign up',
//                 textAlign: TextAlign.center,
//                 style:
//                     Styles.textStyle16z.copyWith(fontWeight: FontWeight.w700),
//               ),
//               15.SH,
//               Form(
//                 key: _formKey,
//                 child: SizedBox(
//                   height: 530,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: CustomTextField(
//                           label: 'Username',
//                           controller: _usernameController,
//                           keyboardType: TextInputType.name,
//                         ),
//                       ),
//                       15.SH,
//                       Expanded(
//                         child: CustomTextField(
//                           label: 'Email Address',
//                           controller: _emailController,
//                           keyboardType: TextInputType.emailAddress,
//                         ),
//                       ),
//                       15.SH,
//                       Expanded(
//                         child: CustomTextField(
//                           label: 'Mobile Number',
//                           controller: _mobileNumberController,
//                           prefixIcon: const UstomContactDropdown(),
//                           keyboardType: TextInputType.phone,
//                         ),
//                       ),
//                       15.SH,
//                       Expanded(
//                         child: CustomTextField(
//                           label: 'Password',
//                           isPassword: true,
//                           controller: _passwordController,
//                           keyboardType: TextInputType.visiblePassword,
//                         ),
//                       ),
//                       15.SH,
//                       Expanded(
//                         child: CustomTextField(
//                           label: 'Confirm Password',
//                           isPassword: true,
//                           controller: _confirmPasswordController,
//                           keyboardType: TextInputType.visiblePassword,
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(left: 8, top: 5, right: 8),
//                         child: Row(
//                           children: [
//                             Checkbox(
//                                 side: const BorderSide(
//                                     width: 1, color: kPrimaryColor),
//                                 activeColor: kPrimaryColor,
//                                 value: checValue,
//                                 onChanged: (val) {
//                                   checValue = val;
//                                   setState(() {});
//                                 }),
//                             const Text(
//                               'I agree with the terms and conditions',
//                               style: TextStyle(
//                                 color: kPrimaryColor,
//                                 fontSize: 14,
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       8.SH,
//                       checValue == true
//                           ? CustomButton(
//                               text: 'Next',
//                               backgroundColor: kPrimaryColor,
//                               onPressed: () {
//                                 if (_formKey.currentState?.validate() ??
//                                     false) {
//                                   Navigator.push(context,
//                                       MaterialPageRoute(builder: (builder) {
//                                     return LoginView();
//                                   }));
//                                   _emailController.clear();
//                                   _usernameController.clear();
//                                   _mobileNumberController.clear();
//                                   _passwordController.clear();
//                                   _confirmPasswordController.clear();
//                                   setState(() {
//                                     checValue = false;
//                                   });
//                                 }
//                               })
//                           : CustomButton(
//                               text: 'Next',
//                               backgroundColor: kPrimaryColor.withOpacity(0.4),
//                               onPressed: () {},
//                             ),
//                     ],
//                   ),
//                 ),
//               ),
//               20.SH,
//               const CustomHelpCenter(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
