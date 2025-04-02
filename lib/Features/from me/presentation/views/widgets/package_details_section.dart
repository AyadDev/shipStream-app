import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'add_package_list_view.dart';
import 'custom__package_summary.dart';
import 'add_package_button.dart';
import 'custom_package_card.dart';

import 'package_section_header.dart';

class PackageDetailsSection extends StatefulWidget {
  const PackageDetailsSection({super.key});

  @override
  State<PackageDetailsSection> createState() => _PackageDetailsSectionState();
}

class _PackageDetailsSectionState extends State<PackageDetailsSection> {
  final _formKey = GlobalKey<FormState>();
  final countController = TextEditingController();
  final lengthController = TextEditingController();
  final widthController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  List<PackageCardModel> savedPackages = [];

  int get totalPieces => savedPackages.length;
  double get totalWeight => savedPackages.fold(
      0.0, (sum, pkg) => sum + (double.tryParse(pkg.weight) ?? 0.0));

  @override
  void dispose() {
    countController.dispose();
    lengthController.dispose();
    widthController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  void _addPackage() {
    if (_formKey.currentState?.validate() ?? false) {
      final newPackage = PackageCardModel(
        count: countController.text,
        length: lengthController.text,
        width: widthController.text,
        height: heightController.text,
        weight: weightController.text,
      );
      setState(() {
        savedPackages.add(newPackage);
        countController.clear();
        lengthController.clear();
        widthController.clear();
        heightController.clear();
        weightController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(title: 'Package details'),
            const SizedBox(height: 30),
            CustomPackageCard(
              countController: countController,
              lengthController: lengthController,
              widthController: widthController,
              heightController: heightController,
              weightController: weightController,
            ),
            PackageList(
              packages: savedPackages,
              onDelete: (index) {
                setState(() {
                  savedPackages.removeAt(index);
                });
              },
            ),
            PackageSummary(
              totalPieces: totalPieces,
              totalWeight: totalWeight,
            ),
            AddPackageButton(
              onPressed: _addPackage,
            ),
          ],
        ),
      ),
    );
  }
}

class PackageCardModel {
  final String count;
  final String length;
  final String width;
  final String height;
  final String weight;

  PackageCardModel({
    required this.count,
    required this.length,
    required this.width,
    required this.height,
    required this.weight,
  });
}
