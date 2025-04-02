import 'package:flutter/material.dart';

import 'custom_asset_info_list_view.dart';

class AssetTrackingViewBody extends StatelessWidget {
  const AssetTrackingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomAssetInfoListView(),
        ),
      ],
    );
  }
}
