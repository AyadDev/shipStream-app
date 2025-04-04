import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../Core/utils/styles.dart';
import '../../../../../constants.dart';

class EstimatedValueSection extends StatefulWidget {
  const EstimatedValueSection({
    super.key,
    required TextEditingController valueController,
  }) : _valueController = valueController;
  final TextEditingController _valueController;

  @override
  State<EstimatedValueSection> createState() => _EstimatedValueSectionState();
}

class _EstimatedValueSectionState extends State<EstimatedValueSection> {
  String _selectedCurrency = 'USD';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How much is the total Estimated  value/price \n of all items? ',
            style: Styles.textStyle15z.copyWith(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              color: const Color(0xFF8F827A),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFA3968E)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: DropdownButton<String>(
                    iconEnabledColor: kPrimaryColor,
                    style: Styles.textStyle15z.copyWith(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor,
                    ),
                    value: _selectedCurrency,
                    underline: const SizedBox(),
                    items: <String>['USD', 'EUR', 'SAR', 'AED', 'EGP']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      _selectedCurrency = newValue ?? 'USD';
                    },
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Container(
                    decoration: ShapeDecoration(
                      color: const Color(0x49D9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: TextFormField(
                      controller: widget._valueController,
                      keyboardType: TextInputType.number,
                      style: Styles.textStyle15z.copyWith(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF6D615A),
                      ),
                      decoration: InputDecoration(
                        hintText: "0.00",
                        hintStyle: Styles.textStyle15z.copyWith(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF6D615A),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFFA3968E)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xFFA3968E)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                      ),
                      cursorColor: const Color(0xFF6D615A),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your value';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/exclamation_mark.svg',
              ),
              const SizedBox(width: 15),
              Text(
                  "Shipment may be subject to customer duty and tax \n paid by the receiver.",
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: Styles.textStyle15z.copyWith(
                    color: const Color(0xFF8F827A),
                    fontSize: 12,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
