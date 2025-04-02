import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/utils/styles.dart';
import 'package:shipstreem_app/Features/Menu/presentation/views/widgets/custom_switch__tile.dart';
import 'package:shipstreem_app/constants.dart';

class PreferencesView extends StatefulWidget {
  const PreferencesView({super.key});

  @override
  State<PreferencesView> createState() => _PreferencesViewState();
}

class _PreferencesViewState extends State<PreferencesView> {
  bool enableNotifications = true;
  bool receiveShipmentUpdates = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 26, color: kPrimaryColor),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 3, color: kPrimaryColor),
                  borderRadius: BorderRadius.circular(55),
                ),
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person_outline,
                  size: 100,
                  color: kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'My Perferences\n',
              style: Styles.textStyle30,
            ),
            CustomSwitchTile(
              fontSize: 26,
              title: 'Notifications',
              subTitle: 'Enable/Disable Notifications',
              value: enableNotifications,
              onChanged: (val) {
                setState(() {
                  enableNotifications = val;
                });
              },
            ),
            const Divider(color: kPrimaryColor, thickness: 2),
            Column(
              children: [
                CustomSwitchTile(
                  fontSize: 22,
                  title: 'NOTIFICATION TYPES',
                  subTitle: 'Receive Shipment Updates',
                  value: receiveShipmentUpdates,
                  onChanged: (val) {
                    setState(() {
                      receiveShipmentUpdates = val;
                    });
                  },
                ),
                CustomSwitchTile(
                  subTitle: 'Adds',
                  value: receiveShipmentUpdates,
                  onChanged: (val) {
                    setState(() {
                      receiveShipmentUpdates = val;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
