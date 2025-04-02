import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
import '../../../../../Core/widgets/custom_navigation_service.dart';
import '../../../../../constants.dart';
import 'asset_info_card.dart';
import '../../../../../Core/widgets/custom_app_bar.dart';
import 'point_to_point_list_view.dart';

class DetailAssetInfoViewBody extends StatelessWidget {
  const DetailAssetInfoViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(onTap: () => Nav.back(), title: 'Shipment Details'),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Shipment no 12345 tracking details',
                        style: TextStyle(
                          color: Color(0xFF575757),
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 125,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                ),
                15.SH,
                const SizedBox(
                  height: 200,
                  child: CustomPointToBointLog(
                    padding: EdgeInsets.all(16),
                  ),
                ),
                30.SH,
                const AssetInfoCard(
                  title: 'Asset Info',
                  data: {
                    'Shipment ID': 'A67495',
                    'Recipient Name': 'receiver name',
                    'Asset Type': 'package || Document',
                    'Estimated Delivery': 'on 17.11.2024',
                  },
                ),
                22.SH,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
