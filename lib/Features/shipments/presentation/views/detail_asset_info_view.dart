import 'package:flutter/material.dart';
import 'widgets/detail_asset_info_view_body.dart';

class DetailAssetInfoView extends StatelessWidget {
  const DetailAssetInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: DetailAssetInfoViewBody(),
    );
  }
}
