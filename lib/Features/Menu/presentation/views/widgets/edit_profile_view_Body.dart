import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
import '../../../../../Core/utils/styles.dart';
import 'custom_edit_list_tile.dart';
import 'custom_profel_card.dart';

class EditProfileViewBody extends StatelessWidget {
  const EditProfileViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Edit Profile\n',
              style: Styles.textStyle20.copyWith(
                fontFamily: 'Inter',
                fontSize: 30,
              ),
            ),
            const CustomProfelCard(),
            // Container(
            //   decoration: ShapeDecoration(
            //     shape: RoundedRectangleBorder(
            //       side: const BorderSide(width: 3, color: Color(0xFFA3968E)),
            //       borderRadius: BorderRadius.circular(55),
            //     ),
            //   ),
            //   child: CircleAvatar(
            //     radius: 50,
            //     backgroundColor: Colors.white,
            //     child: Icon(
            //       Icons.person_outline,
            //       size: 100,
            //       color: Color(0xFFA3968E),
            //     ),
            //   ),
            // ),
            16.SH,
            const CustomEditListTile(label: 'Name'),
            const CustomEditListTile(label: 'Surname'),
            const CustomEditListTile(label: 'Username'),
            const CustomEditListTile(label: 'Password'),
            const CustomEditListTile(label: 'Email Address'),
            const CustomEditListTile(label: 'Mobile Number'),
          ],
        ),
      ),
    );
  }
}
