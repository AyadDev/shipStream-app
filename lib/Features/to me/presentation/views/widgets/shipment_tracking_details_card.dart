import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../../constants.dart';
import '../../../../shipments/presentation/views/widgets/point_to_point_list_view.dart';

class ShipmentTrackingDetailsCard extends StatelessWidget {
  const ShipmentTrackingDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 259,
      decoration: ShapeDecoration(
        color: const Color(0xFFF7F7F7),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFA3968E)),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 5, bottom: 10),
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
                  textAlign: TextAlign.start,
                ),
                Container(
                  height: 2,
                  width: 125,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: const Padding(
                padding: EdgeInsets.only(left: 3, top: 5, bottom: 5),
                child: CustomPointToBointLog(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
