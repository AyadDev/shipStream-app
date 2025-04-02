import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';

class CustomShipmentDateInput extends StatefulWidget {
  const CustomShipmentDateInput({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  State<CustomShipmentDateInput> createState() =>
      _CustomShipmentDateInputState();
}

class _CustomShipmentDateInputState extends State<CustomShipmentDateInput> {
  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2025, 8, 17),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null) {
      setState(() {
        widget.controller.text =
            "${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 55,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 3, color: Color(0xFFA3968E)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Expanded(
        child: TextFormField(
          controller: widget.controller,
          readOnly: true,
          style: Styles.textStyle15,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            label: const Text('Date'),
            hintText: 'MM/DD/YYYY',
            labelStyle: Styles.textStyle17,
            suffixIcon: Container(
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(color: Color(0x1E49454F)),
                child: const SizedBox(
                  width: 24,
                  height: 24,
                  child: Icon(
                    Icons.calendar_today,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            border: InputBorder.none,
          ),
          onTap: _pickDate,
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return 'Please enter your Date';
          //   }
          //   return null;
          // },
        ),
      ),
    );
  }
}
