import 'package:flutter/material.dart';
import 'package:shipstreem_app/Features/to%20me/presentation/views/invalid_trucking_number_view.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/widgets/custom_elevated_button.dart';
import '../../../../../Core/widgets/custom_navigation_service.dart';
import '../../../../../Core/widgets/custom_search_text_field.dart';
import '../../../../../constants.dart';
import 'custom_estimated_delivery_card.dart';
import 'shipment_tracking_details_card.dart';

class ToMeViewBody extends StatelessWidget {
  ToMeViewBody({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add a shipment to track',
                style: Styles.textStyle15.copyWith(
                    color: kPrimaryColor, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CustomSearchTextField(
                  controller: _searchController,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: CustomElevatedButton(
                    color: kPrimaryColor,
                    radius: 13,
                    height: 40,
                    formKey: GlobalKey(),
                    title: Text(
                      'Track',
                      style: Styles.textStyle15.copyWith(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const InvalidTruckingNumberView();
                        }));
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  children: [
                    const EstimatedDeliveryCard(),
                    const SizedBox(height: 16),
                    const ShipmentTrackingDetailsCard(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      child: CustomElevatedButton(
                        color: kPrimaryColor,
                        radius: 13,
                        height: 40,
                        formKey: GlobalKey(),
                        title: Text('Add To My Shipments',
                            style: Styles.textStyle15
                                .copyWith(color: Colors.white)),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Nav.to(const InvalidTruckingNumberView());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
