import 'package:flutter/material.dart';
import 'contact_details_section.dart';
import 'estimated_value_section.dart';
import 'package_details_section.dart';
import 'process_button.dart';
import 'shipment_details_section.dart';

class FromMeViewBody extends StatelessWidget {
  FromMeViewBody({super.key});

  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _shippingFormController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _subPhoneController = TextEditingController();
  final _valueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ShipmentDetailsSection(
                dateController: _dateController,
                shippingFormController: _shippingFormController,
              ),
              Divider(color: Colors.grey.shade400, thickness: 1),
              const PackageDetailsSection(),
              Divider(color: Colors.grey.shade400, thickness: 1),
              EstimatedValueSection(valueController: _valueController),
              Divider(color: Colors.grey.shade400, thickness: 1),
              ContactDetailsSection(
                nameController: _nameController,
                phoneController: _phoneController,
                subPhoneController: _subPhoneController,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 50),
              ProcessButton(formKey: _formKey),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
