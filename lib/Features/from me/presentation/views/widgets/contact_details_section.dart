import 'package:flutter/material.dart';
import '../../../../../Core/utils/styles.dart';
import 'custom_contact_dropdown.dart';
import 'custom_contact_label_total.dart';
import 'custom_contact_input.dart';

class ContactDetailsSection extends StatelessWidget {
  ContactDetailsSection({
    super.key,
    required TextEditingController nameController,
    required TextEditingController phoneController,
    required TextEditingController subPhoneController,
  })  : _nameController = nameController,
        _phoneController = phoneController,
        _subPhoneController = subPhoneController;
  final TextEditingController _nameController;
  final TextEditingController _phoneController;
  final TextEditingController _subPhoneController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Details',
            style: Styles.textStyle16z.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 40,
          ),
          const CustomContactLabelTotal(
            label: 'Name',
            icon: Icons.account_circle,
          ),
          CustomContactInput(
            hintText: 'Sender Name',
            controller: _nameController,
            keyboardType: TextInputType.name,
          ),
          const CustomContactLabelTotal(
            label: 'Phone Number',
            icon: Icons.phone,
          ),
          CustomContactInput(
            hintText: 'Mobile Number',
            prefixIcon: const UstomContactDropdown(),
            controller: _phoneController,
            keyboardType: TextInputType.phone,
          ),
          const CustomContactLabelTotal(
            label: 'Substitute Mobile Number',
            icon: Icons.phone,
          ),
          CustomContactInput(
            hintText: 'Mobile Number',
            prefixIcon: const UstomContactDropdown(),
            controller: _subPhoneController,
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
