import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
import '../../../../../Core/utils/styles.dart';

class CustomHelpCenter extends StatelessWidget {
  const CustomHelpCenter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Need help? Visit our ',
            style: Styles.textStyle16z.copyWith(
              fontWeight: FontWeight.w700,
            )),
        5.SH,
        GestureDetector(
          onTap: () {},
          child: Text(
            'help center',
            style: Styles.textStyle16z.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
