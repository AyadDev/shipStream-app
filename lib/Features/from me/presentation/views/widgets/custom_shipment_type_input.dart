import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';

class CustomShipmntInputType extends StatefulWidget {
  const CustomShipmntInputType({super.key});

  @override
  State<CustomShipmntInputType> createState() => _CustomShipmntTypeInputState();
}

class _CustomShipmntTypeInputState extends State<CustomShipmntInputType> {
  String shipmentType = "document";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          Expanded(
            child: RadioListTile<String>(
              activeColor: kPrimaryColor,
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Document",
                style: Styles.textStyle17,
              ),
              value: "document",
              groupValue: shipmentType,
              onChanged: (val) {
                setState(() {
                  shipmentType = val ?? "document";
                });
              },
            ),
          ),
          Expanded(
            child: RadioListTile<String>(
              activeColor: kPrimaryColor,
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "Package",
                style: Styles.textStyle17,
              ),
              value: "package",
              groupValue: shipmentType,
              onChanged: (val) {
                setState(() {
                  shipmentType = val ?? "package";
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
