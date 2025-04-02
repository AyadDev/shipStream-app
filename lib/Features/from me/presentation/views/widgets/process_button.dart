import 'package:flutter/material.dart';
import 'package:shipstreem_app/Features/shipping%20options/presentation/views/shipping_options_view.dart';

class ProcessButton extends StatefulWidget {
  const ProcessButton({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  State<ProcessButton> createState() => _ProcessButtonState();
}

class _ProcessButtonState extends State<ProcessButton> {
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (widget._formKey.currentState?.validate() ?? false) {
          setState(() {
            _isSubmitting = true;
          });
          await Future.delayed(const Duration(seconds: 5));
          setState(() {
            _isSubmitting = false;
          });

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ShippingOptionsView();
          }));
        }

        // _isSubmitting ? null : _submitValue;
      },
      child: Container(
        width: 320,
        height: 68.61,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
        decoration: ShapeDecoration(
          color: const Color(0xFFA3968E),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: _isSubmitting
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white))
            : const Text(
                'Process',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Color(0xFF000000),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}


  // لمعرفة إن كنا في طور الإرسال
  // final TextEditingController _valueController =
  //     TextEditingController(text: "200");

  // String _selectedCurrency = 'Pichup Otder';

  // Future<void> _submitValue() async {
  //   setState(() {
  //     _isSubmitting = true;
  //   });

  //   try {
  //     // استدعاء الدالة الوهمية في الباك اند المحلي
  //     final result = await FakeBackend.submitValue(
  //       currency: _selectedCurrency,
  //       totalValue: _valueController.text,
  //     );

  //     // عند النجاح نعرض رسالة
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(result)),
  //     );
  //   } catch (e) {
  //     // في حال حدوث خطأ
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('خطأ في الإرسال: $e')),
  //     );
  //   } finally {
  //     setState(() {
  //       _isSubmitting = false;
  //     });
  //   }
  // }



// class FakeBackend {
//   // دالة ثابتة لاستقبال قيمة العملة والمبلغ
//   static Future<String> submitValue({
//     required String currency,
//     required String totalValue,
//   }) async {
//     // محاكاة عملية تستغرق بعض الوقت (كأننا نرسل الطلب لسيرفر)
//     await Future.delayed(const Duration(seconds: 2));

//     // هنا يمكن تخزين البيانات في قاعدة بيانات محلية أو أي منطق آخر
//     // حاليًا نعيد رسالة نجاح تجريبية
//     return "Data submitted successfully: $currency $totalValue";
//   }
// }
