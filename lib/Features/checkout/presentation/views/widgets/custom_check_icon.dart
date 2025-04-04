import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
import 'package:shipstreem_app/constants.dart';
import '../../../../../Core/utils/styles.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: kPrimaryColor,
            child: Icon(
              Icons.check,
              size: 50,
              color: Colors.white,
            ),
          ),
          10.SH,
          Text(
            'Payment Successful',
            style: Styles.textStyle17
                .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
