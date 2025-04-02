import 'package:flutter/material.dart';

import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';

class AssetInfoCard extends StatelessWidget {
  const AssetInfoCard({super.key, required this.title, required this.data});
  final String title;
  final Map<String, String> data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          shadows: const [
            BoxShadow(
              color: kPrimaryColor,
              blurRadius: 4,
              offset: Offset(
                0.1,
                0.1,
              ),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: const ShapeDecoration(
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  style: Styles.textStyle18,
                ),
              ),
            ),
            ...data.entries.map((entry) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(entry.key, style: Styles.textStyle12),
                        ),
                        Text(
                          ':',
                          style:
                              Styles.textStyle12.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            entry.value,
                            style: Styles.textStyle12.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
