import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';


class UstomContactDropdown extends StatefulWidget {
  const UstomContactDropdown({super.key});

  @override
  State<UstomContactDropdown> createState() => _UstomContactDropdownState();
}

class _UstomContactDropdownState extends State<UstomContactDropdown> {
  String? countery;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 35,
        width: 65,
        child: Center(
          child: DropdownButton(
              underline: const Text(''),
              iconEnabledColor: kPrimaryColor,
              value: countery,
              hint: const Text(
                '+967',
              ),
              style: Styles.textStyle16z,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'yemen',
                  child: Text('+967'),
                ),
                DropdownMenuItem(
                  value: 'syria',
                  child: Text('+964'),
                ),
                DropdownMenuItem(
                  value: 'egypt',
                  child: Text('+678'),
                ),
              ],
              onChanged: (val) {
                countery = val;
                setState(() {});
              }),
        ),
      ),
    );
  }
}
