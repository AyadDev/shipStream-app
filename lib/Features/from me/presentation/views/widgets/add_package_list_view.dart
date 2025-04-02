import 'package:flutter/material.dart';

import 'custom_saved_package_card.dart';
import 'package_details_section.dart';

/// Widget لعرض القائمة الخاصة بالبكجات المضافة
class PackageList extends StatelessWidget {
  final List<PackageCardModel> packages;
  final Function(int) onDelete;
  const PackageList(
      {super.key, required this.packages, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: packages.length,
      itemBuilder: (context, index) {
        return SavedPackageCard(
          package: packages[index],
          onDelete: () => onDelete(index),
        );
      },
    );
  }
}
