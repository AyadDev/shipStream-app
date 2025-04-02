import 'package:flutter/material.dart';
import 'package:shipstreem_app/constants.dart';
import '../../../../../Core/utils/styles.dart';
import '../detail_asset_info_view.dart';

class CustomAssetCard extends StatelessWidget {
  const CustomAssetCard({
    super.key,
    required this.shipmentID,
    required this.senderName,
    required this.recipient,
    required this.trackingNo,
  });

  final String shipmentID;
  final String senderName;
  final String recipient;
  final String trackingNo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: Container(
        width: 334,
        height: 80,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 0),
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          children: [
            Container(
              width: 30,
              decoration: const ShapeDecoration(
                color: kPrimaryColor, // 0xFFB0A090
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Shipment ID     :    ',
                          style: Styles.textStyle10,
                        ),
                        TextSpan(
                          text: shipmentID,
                          style:
                              Styles.textStyle10.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'sender Name   :    ',
                          style: Styles.textStyle10,
                        ),
                        TextSpan(
                          text: senderName,
                          style:
                              Styles.textStyle10.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Recipient          :    ',
                          style: Styles.textStyle10,
                        ),
                        TextSpan(
                          text: recipient,
                          style:
                              Styles.textStyle10.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Tracking No.     ',
                          style: Styles.textStyle10,
                        ),
                        TextSpan(
                          text: trackingNo,
                          style:
                              Styles.textStyle10.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const DetailAssetInfoView();
                      }));
                    },
                    child: Text(
                      'View Detail',
                      style: Styles.textStyle10.copyWith(
                        decoration: TextDecoration.underline,
                        color: const Color(0xff0066FF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
