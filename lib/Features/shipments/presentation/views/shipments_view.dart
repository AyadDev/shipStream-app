import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/widgets/custom_tab_bar.dart';
import '../../../../Core/utils/layout.dart';
import '../../../../Core/widgets/custom_navigation_service.dart';
import 'widgets/asset_info_view_body.dart';
import '../../../../Core/widgets/custom_app_bar.dart';

class ShipmentsView extends StatelessWidget {
  const ShipmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(146),
          child: Column(
            children: [
              CustomAppBar(
                onTap: () => Nav.to(const Layout()),
                title: 'Shipment History',
              ),
              CustomTabBar(
                tabs: const [
                  Tab(text: "All"),
                  Tab(text: "Ongoing"),
                  Tab(text: "Delivered"),
                  Tab(text: "Waiting"),
                ],
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AssetTrackingViewBody(),
            Center(
                child:
                    Text("Ongoing Shipments", style: TextStyle(fontSize: 16))),
            Center(
                child: Text("Delivered Shipments",
                    style: TextStyle(fontSize: 16))),
            Center(
                child:
                    Text("Waiting Shipments", style: TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
