import 'package:flutter/material.dart';
import 'package:shipstreem_app/Features/Menu/presentation/views/menu_view.dart';

import '../../../../../Core/utils/styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 339,
      backgroundColor: const Color(0xFFE3E0DF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: Row(
              children: [
                Container(
                  width: 85,
                  height: 85,
                  decoration: const ShapeDecoration(
                    color: Color(0xFFA3968E),
                    shape: OvalBorder(),
                  ),
                ),
                const SizedBox(width: 30),
                const SizedBox(
                  height: 72,
                  child: Center(
                    child: Text(
                      'User Name',
                      style: Styles.textStyle20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Color(0xFFA3968E),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 152,
                  height: 42,
                  child: Text(
                    'Track',
                    style: Styles.textStyle20,
                  ),
                ),
                const Divider(
                  color: Color(0xFFA3968E),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 152,
                  height: 42,
                  child: Text(
                    'Legals',
                    style: Styles.textStyle20,
                  ),
                ),
                const Divider(
                  color: Color(0xFFA3968E),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 152,
                  height: 42,
                  child: Text(
                    'Support',
                    style: Styles.textStyle20,
                  ),
                ),
                const Divider(
                  color: Color(0xFFA3968E),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 152,
                  height: 42,
                  child: Text(
                    'Service points',
                    style: Styles.textStyle20,
                  ),
                ),
                const Divider(
                  color: Color(0xFFA3968E),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 152,
                  height: 42,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const MenuView();
                      }));
                    },
                    child: const Text(
                      'Settings',
                      style: Styles.textStyle20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 301,
            height: 301,
            padding: const EdgeInsets.only(
              top: 35.01,
              left: 15.96,
              right: 22.77,
              bottom: 3.96,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 253.27,
                  height: 266.03,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/Group.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
