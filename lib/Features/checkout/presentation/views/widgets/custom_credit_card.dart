import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:shipstreem_app/Core/utils/styles.dart';
import 'package:shipstreem_app/constants.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard(
      {super.key, required this.formKey, required this.autovalidateMode});

  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '', expiryDate = '', cardHolderName = '', cvvCode = '';

  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          cardType: CardType.mastercard,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: showBackView,
          isHolderNameVisible: true,
          cardBgColor: kPrimaryColor,
          onCreditCardWidgetChange: (value) {},
        ),
        CreditCardForm(
            inputConfiguration: InputConfiguration(
              cardHolderDecoration: customInputDecoration(
                  label: 'Name on Card', hintText: 'Meet Batel'),
              cardNumberDecoration: customInputDecoration(
                  label: 'Card Namber', hintText: '0000 0000 0000 0000'),
              cvvCodeDecoration: customInputDecoration(
                  label: 'Card Security Code', hintText: 'Code'),
              expiryDateDecoration: customInputDecoration(
                  label: 'Expiry Date', hintText: 'MM/YY'),
            ),
            isHolderNameVisible: true,
            autovalidateMode: widget.autovalidateMode,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            isCardHolderNameUpperCase: true,
            isExpiryDateVisible: true,
            onCreditCardModelChange: (carditCardModel) {
              cardHolderName = carditCardModel.cardHolderName;
              expiryDate = carditCardModel.expiryDate;
              cvvCode = carditCardModel.cvvCode;
              cardNumber = carditCardModel.cardNumber;
              showBackView = carditCardModel.isCvvFocused;
              setState(() {});
            },
            formKey: widget.formKey),
      ],
    );
  }

  InputDecoration customInputDecoration(
      {required String label, required String hintText}) {
    return InputDecoration(
        label: Text(label),
        hintText: hintText,
        semanticCounterText: '55',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: kPrimaryColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: kPrimaryColor)),
        labelStyle: Styles.textStyle17.copyWith(fontWeight: FontWeight.w600),
        hintStyle: Styles.textStyle17
            .copyWith(color: const Color(0xFF1D1B20).withOpacity(0.4)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: kPrimaryColor)),
        focusColor: kPrimaryColor);
  }
}
