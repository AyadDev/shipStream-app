import 'package:flutter/material.dart';
import 'custom_asset_card.dart';

class CustomAssetInfoListView extends StatelessWidget {
  CustomAssetInfoListView({super.key});

  final List<Map<String, String>> data = List.generate(5, (index) {
    return {
      'shipmentID': 'AD535',
      'senderName': 'Sender Name',
      'recipient': 'Receiver name $index',
      'trackingNo': 'BL12345',
    };
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return CustomAssetCard(
          shipmentID: data[index]['shipmentID']!,
          senderName: data[index]['senderName']!,
          recipient: data[index]['recipient']!,
          trackingNo: data[index]['trackingNo']!,
        );
      },
    );
  }
}
