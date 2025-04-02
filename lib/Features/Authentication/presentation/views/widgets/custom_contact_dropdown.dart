import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/utils/styles.dart';

class UstomContactDropdown extends StatefulWidget {
  const UstomContactDropdown({super.key});

  @override
  State<UstomContactDropdown> createState() => _UstomContactDropdownState();
}

class _UstomContactDropdownState extends State<UstomContactDropdown> {
  String? countery;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 120,
      child: Center(
        child: CountryCodePicker(
          onChanged: (countryCode) {
            countryCode.code;
            print('البلد المختار ${countryCode.name}');
          },
          initialSelection: 'Ye',
          favorite: ['+967', 'Ye'],
          alignLeft: true,
          dialogTextStyle: Styles.textStyle20.copyWith(fontSize: 16),
          searchStyle: Styles.textStyle20
              .copyWith(fontSize: 16, fontWeight: FontWeight.w200),
          padding: EdgeInsets.zero,
          headerTextStyle: Styles.textStyle20,
          textStyle: Styles.textStyle20.copyWith(fontSize: 16),
          // showDropDownButton: true,
        ),

        // child: DropdownButton(
        //     underline: const SizedBox(),
        //     iconEnabledColor: kPrimaryColor,
        //     value: countery,
        //     hint: const Text(
        //       '+967',
        //     ),
        //     style: const TextStyle(
        //       color: kPrimaryColor,
        //       fontSize: 16,
        //       fontFamily: 'Inter',
        //       fontWeight: FontWeight.w400,
        //     ),
        //     isExpanded: true,
        //     items: const [
        //       DropdownMenuItem(
        //         value: 'yemen',
        //         child: Text('+967'),
        //       ),
        //       DropdownMenuItem(
        //         value: 'syria',
        //         child: Text('+964'),
        //       ),
        //       DropdownMenuItem(
        //         value: 'egypt',
        //         child: Text('+678'),
        //       ),
        //     ],
        //     onChanged: (val) {
        //       countery = val;
        //       setState(() {});
        //     }),
      ),
    );
  }
}
