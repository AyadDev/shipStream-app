import 'package:flutter/material.dart';
import 'package:shipstreem_app/Features/Menu/presentation/views/menu_view.dart';
import '../../../../Core/widgets/custom_navigation_service.dart';
import '../../../../constants.dart';
import 'widgets/edit_profile_view_Body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kPrimaryColor),
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Nav.to(const LogoutView()),
          ),
        ],
      ),
      body: const EditProfileViewBody(),
    );
  }
}
