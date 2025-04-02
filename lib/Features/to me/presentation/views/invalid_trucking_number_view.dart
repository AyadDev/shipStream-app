import 'package:flutter/material.dart';
import '../../../../Core/widgets/custom_app_bar.dart';
import 'widgets/invalid_tracking_dialog.dart';

class InvalidTruckingNumberView extends StatelessWidget {
  const InvalidTruckingNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(101),
        child: CustomAppBar(
          title: 'Tracking Detail',
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: Colors.black.withAlpha(55),
        child: const Center(
          child: InvalidTrackingDialog(),
        ),
      ),
    );
  }
}
