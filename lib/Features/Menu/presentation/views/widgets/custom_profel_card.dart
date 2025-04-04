import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shipstreem_app/constants.dart';

class CustomProfelCard extends StatefulWidget {
  const CustomProfelCard({super.key});

  @override
  State<CustomProfelCard> createState() => _CustomProfelCardState();
}

class _CustomProfelCardState extends State<CustomProfelCard> {
  String? imagePath;
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showModalBottomSheet(
            context: context,
            builder: (ctx) {
              return Container(
                width: double.infinity,
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async {
                        await pickImage(ImageSource.camera);
                      },
                      child: const Icon(
                        Icons.camera_alt,
                        size: 50,
                        color: kPrimaryColor,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await pickImage(ImageSource.gallery);
                      },
                      child: const Icon(
                        Icons.folder_copy,
                        size: 50,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: imagePath == null
          ? SizedBox(
              height: 100,
              width: 100,
              child: SvgPicture.asset(
                'assets/icons/icon_edit_profile.svg',
              ),
            )
          : Container(
              height: 100,
              width: 100,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: FileImage(File(imagePath!)),
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 3, color: Color(0xFFA3968E)),
                  borderRadius: BorderRadius.circular(55),
                ),
              ),
            ),
    );
  }

  Future<void> pickImage(ImageSource source) async {
    XFile? image = await picker.pickImage(source: source);
    imagePath = image?.path;
    setState(() {});
  }

  selectImage() {}
}
