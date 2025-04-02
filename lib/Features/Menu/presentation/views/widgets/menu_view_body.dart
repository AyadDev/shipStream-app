import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/widgets/custom_navigation_service.dart';
import '../edit_profile_view.dart';
import '../preferences_view.dart';
import 'custom_menu_list_tile.dart';

class MenuViewBody extends StatelessWidget {
  const MenuViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 34, top: 16, right: 34),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.SH,
            Text('My Profile',
                style: Styles.textStyle30.copyWith(fontSize: 25)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  CustomMenuListTile(
                    icon: Icons.person,
                    text: 'Personal Details',
                    onTap: () => Nav.to(const EditProfileView()),
                  ),
                  CustomMenuListTile(
                    icon: Icons.account_box_outlined,
                    text: 'Account',
                    onTap: () {},
                  ),
                  CustomMenuListTile(
                    icon: Icons.notifications_outlined,
                    text: 'Notification settings',
                    onTap: () => Nav.to(const PreferencesView()),
                  ),
                  CustomMenuListTile(
                    icon: Icons.payment_outlined,
                    text: 'Billing',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Text(
              'Help',
              style: Styles.textStyle30.copyWith(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  CustomMenuListTile(
                    icon: Icons.question_answer_outlined,
                    text: 'FAQ\'s',
                    onTap: () {},
                  ),
                  CustomMenuListTile(
                    icon: Icons.support_agent_outlined,
                    text: 'Support',
                    onTap: () {},
                  ),
                  CustomMenuListTile(
                    icon: Icons.feedback_outlined,
                    text: 'Feedback',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Text(
              'About',
              style: Styles.textStyle30.copyWith(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  CustomMenuListTile(
                    icon: Icons.description_outlined,
                    text: 'Terms & conditions',
                    onTap: () {},
                  ),
                  CustomMenuListTile(
                    icon: Icons.privacy_tip_outlined,
                    text: 'Privacy Policy',
                    onTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
