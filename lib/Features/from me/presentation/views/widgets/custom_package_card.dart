import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
import '../../../../../Core/utils/styles.dart';
import 'custom_package_input.dart';

/// Widget لعرض كارت تعبئة بيانات الباكدج الجديد
class CustomPackageCard extends StatelessWidget {
  const CustomPackageCard({
    super.key,
    required this.countController,
    required this.lengthController,
    required this.widthController,
    required this.heightController,
    required this.weightController,
  });

  final TextEditingController countController;
  final TextEditingController lengthController;
  final TextEditingController widthController;
  final TextEditingController heightController;
  final TextEditingController weightController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFA3968E)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/images/Group.png',
                  width: 90.77,
                  height: 110.48,
                ),
              ),
              10.SW,
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Package Dimensions',
                        style: Styles.textStyle15z.copyWith(fontSize: 18),
                      ),
                      16.SH,
                      CustomPackageInput(
                        labelText: 'Count',
                        controller: countController,
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(flex: 1, child: SizedBox(width: 45)),
            ],
          ),
          16.SH,
          Row(
            children: [
              Expanded(
                child: CustomPackageInput(
                  labelText: 'Length (CM)',
                  controller: lengthController,
                ),
              ),
              30.SW,
              Expanded(
                child: CustomPackageInput(
                  labelText: 'Width (CM)',
                  controller: widthController,
                ),
              ),
            ],
          ),
          16.SH,
          Row(
            children: [
              Expanded(
                child: CustomPackageInput(
                  labelText: 'Height (CM)',
                  controller: heightController,
                ),
              ),
              30.SW,
              Expanded(
                child: CustomPackageInput(
                  labelText: 'Weight (Kg)',
                  controller: weightController,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
