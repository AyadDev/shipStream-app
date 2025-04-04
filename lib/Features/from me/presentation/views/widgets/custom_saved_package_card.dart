import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shipstreem_app/Core/widgets/custom_sized_box.dart';
import '../../../../../Core/utils/styles.dart';
import 'custom_package_input.dart';
import 'package_details_section.dart';

class SavedPackageCard extends StatelessWidget {
  final PackageCardModel package;
  final VoidCallback onDelete;

  const SavedPackageCard({
    super.key,
    required this.package,
    required this.onDelete,
  });

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
              const SizedBox(width: 10),
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
                      const SizedBox(height: 16),
                      CustomPackageInput(
                        labelText: 'Count',
                        initialValue: package.count,
                        enabled: false,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: onDelete,
                  child: SvgPicture.asset(
                    'assets/icons/Icon_trash.svg',
                    width: 45,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomPackageInput(
                  labelText: 'Length (CM)',
                  initialValue: package.length,
                  enabled: false,
                ),
              ),
              30.SW,
              Expanded(
                child: CustomPackageInput(
                  labelText: 'Width (CM)',
                  initialValue: package.width,
                  enabled: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomPackageInput(
                  labelText: 'Height (CM)',
                  initialValue: package.height,
                  enabled: false,
                ),
              ),
              30.SW,
              Expanded(
                child: CustomPackageInput(
                  labelText: 'Weight (Kg)',
                  initialValue: package.weight,
                  enabled: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
