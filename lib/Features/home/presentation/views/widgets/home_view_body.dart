import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/widgets/custom_search_text_field.dart';

import 'custom_drawer.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({
    super.key,
  });
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 446,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/IMG-20250301-WA0015.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        // SizedBox(
        //   height: 465,
        //   width: double.infinity,
        //   child: Flexible(
        //       child: FittedBox(
        //           child: ClipRRect(
        //     borderRadius: const BorderRadius.vertical(
        //       bottom: Radius.circular(30),
        //     ),
        //     child: Image.asset(
        //       'assets/images/IMG-20250301-WA0015.jpg',
        //       height: 446,
        //     ),
        //   ))),
        // ),
        // Positioned(
        //     top: 40,
        //     left: 0,
        //     child: DrawerButton(
        //       style: const ButtonStyle(
        //           iconColor: MaterialStatePropertyAll(Colors.white)),
        //       onPressed: () {
        //         Navigator.push(context, MaterialPageRoute(builder: (context) {
        //           return const SizedBox(width: 339, child: CustomDrawer());
        //         }));
        //       },
        //     )),
        // Positioned(
        //   top: 0,
        //   left: 95,
        //   child: Container(
        //     padding: EdgeInsets.zero,
        //     width: 194,
        //     height: 145,
        //     decoration: const BoxDecoration(
        //       image: DecorationImage(
        //         image: AssetImage('assets/images/logo.png'),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),
        Positioned(
          top: 380,
          left: 20,
          right: 20,
          child: Form(
            key: _formKey,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CustomSearchTextField(
                  controller: _searchController,
                )),
          ),
        ),
      ],
    );
  }
}
