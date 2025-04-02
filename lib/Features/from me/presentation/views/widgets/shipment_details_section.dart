import 'package:flutter/material.dart';
import 'custom_shipment_date_input.dart';
import 'custom_shipment_labels.dart';
import 'custom_shipment_time_input.dart';
import 'custom_shipment_type_input.dart';
import 'custom_shipping_card.dart';

class ShipmentDetailsSection extends StatelessWidget {
  const ShipmentDetailsSection({
    super.key,
    required this.dateController,
    required this.shippingFormController,
  });

  final TextEditingController dateController;
  final TextEditingController shippingFormController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      width: MediaQuery.sizeOf(context).width,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        // height: 540.75,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFA3968E)),
            borderRadius: BorderRadius.circular(5),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x4C91C9FD),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 97.89,
              decoration: const ShapeDecoration(
                color: Color(0xFFA3968E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              width: MediaQuery.sizeOf(context).width,
              height: 600,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomShipmentLabels(
                    title: 'Pickup Date :',
                  ),
                  const SizedBox(height: 16),
                  CustomShipmentDateInput(
                    controller: dateController,
                  ),
                  const SizedBox(height: 16),
                  const CustomShipmentLabels(
                    title: 'Pickup Time (optional)',
                  ),
                  const SizedBox(height: 16),
                  const CustomShipmentTimeInput(),
                  const SizedBox(height: 16),
                  const CustomShipmentLabels(
                    title: 'Shipment type:',
                  ),
                  const SizedBox(height: 16),
                  const CustomShipmntInputType(),
                  const SizedBox(height: 16),
                  CustomShippingCard(
                    controller: shippingFormController,
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
