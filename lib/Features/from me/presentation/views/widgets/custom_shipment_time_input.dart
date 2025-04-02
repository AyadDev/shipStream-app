import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';

class CustomShipmentTimeInput extends StatefulWidget {
  const CustomShipmentTimeInput({super.key});

  @override
  State<CustomShipmentTimeInput> createState() =>
      _CustomShipmentTimeInputState();
}

class _CustomShipmentTimeInputState extends State<CustomShipmentTimeInput> {
  final _timeController = TextEditingController();

  Future<void> _pickTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 20, minute: 0),
    );
    if (pickedTime != null) {
      setState(() {
        final hour =
            pickedTime.hourOfPeriod == 0 ? 12 : pickedTime.hourOfPeriod;
        final period = pickedTime.period == DayPeriod.am ? "AM" : "PM";
        final minute = pickedTime.minute.toString().padLeft(2, '0');
        _timeController.text = "$hour : $minute  $period";
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
        child: TextFormField(
          controller: _timeController,
          readOnly: true,
          style: Styles.textStyle15,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            label: const Text('Time'),
            hintText: 'Select Time',
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
                    Icons.access_time,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            border: InputBorder.none,
          ),
          onTap: _pickTime,
        ));
  }
}
