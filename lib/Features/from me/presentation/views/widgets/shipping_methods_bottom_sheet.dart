import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../Core/widgets/custom_elevated_button.dart';
import '../../../../../constants.dart';
import '../../../../../map_view.dart';
import '../../view_model/address_cubit/address_cubit.dart';
import 'custom_location_input.dart';

class ShippingMethodsBottomSheet extends StatefulWidget {
  const ShippingMethodsBottomSheet({super.key, required this.title});
  final String title;

  @override
  State<ShippingMethodsBottomSheet> createState() =>
      _ShippingMethodsBottomSheetState();
}

class _ShippingMethodsBottomSheetState
    extends State<ShippingMethodsBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  // final _countryController = TextEditingController();
  // final _cityController = TextEditingController();
  // final _streetController = TextEditingController();
  // final _districtController = TextEditingController();
  void _openMapSelection(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MapView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        String country = '';
        String city = '';
        String district = '';
        String street = '';
        if (state is AddressLoaded) {
          country = state.address.country;
          city = state.address.city;
          district = state.address.district;
          street = state.address.street;
        }
        return SingleChildScrollView(
          child: Container(
            width: 430,
            height: 720,
            decoration: const ShapeDecoration(
              color: Color(0xFFA3968E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28)),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 123,
                  offset: Offset(116, 107),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Divider(color: Colors.white),
                      Row(
                        children: [
                          CustomLocationInput(
                            width: 280,
                            label: 'Country',
                            icon: Icons.location_on,
                            controller: TextEditingController(text: country),
                          ),
                          GestureDetector(
                            onTap: () => _openMapSelection(context),
                            //  {
                            //   Navigator.push(context,
                            //       MaterialPageRoute(builder: (builder) {
                            //     return MapSelectionScreen();
                            //   }));
                            // },
                            child: SvgPicture.asset(
                              'assets/icons/icon_map.svg',
                            ),
                          )
                        ],
                      ),
                      CustomLocationInput(
                        label: 'City',
                        icon: Icons.location_city,
                        controller: TextEditingController(text: city),
                      ),
                      CustomLocationInput(
                        label: 'District or Province',
                        icon: Icons.location_pin,
                        controller: TextEditingController(text: district),
                      ),
                      CustomLocationInput(
                        label: 'Street',
                        icon: Icons.streetview,
                        controller: TextEditingController(text: street),
                      ),
                      const Spacer(),
                      Container(
                        padding:
                            const EdgeInsets.only(top: 20, left: 30, right: 30),
                        width: double.infinity,
                        height: 100,
                        decoration: ShapeDecoration(
                          color: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 8,
                              offset: Offset(-1, -10),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Center(
                          child: CustomElevatedButton(
                            formKey: _formKey,
                            title:
                                const Text('Save', style: Styles.textStyle30),
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                return Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
