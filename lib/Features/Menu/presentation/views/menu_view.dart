import 'package:flutter/material.dart';
import 'package:shipstreem_app/Core/utils/styles.dart';
import 'package:shipstreem_app/constants.dart';
import 'widgets/menu_view_body.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    // يمكن استخدام Scaffold مع AppBar بسيط أو تصميم مخصص
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 36,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Logout',
                style: Styles.textStyle30,
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.close, size: 26, color: kPrimaryColor),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LogoutView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: const MenuViewBody(),
    );
  }
}

// شاشة افتراضية للخروج (يمكنك تخصيصها كما تريد)
class LogoutView extends StatelessWidget {
  const LogoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // مثال لشاشة الخروج أو تسجيل الدخول
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: const Center(
        child: Text('You have been logged out!'),
      ),
    );
  }
}




// ---

// ملاحظات ختامية:

// يمكن استخدام Themes لتوحيد الألوان والخطوط على مستوى التطبيق كله.

// يمكنك تعديل الألوان (مثل Color(0xFF8D6E63)) والخلفيات (Color(0xFFF5F5F5)) لتتوافق تمامًا مع التصميم المطلوب.

// إذا أردت محاذاة النص للعربية أو تغيير اتجاه الواجهة إلى RTL، يمكنك إضافة:

// MaterialApp(
//   localizationsDelegates: [
//     // ...
//   ],
//   supportedLocales: [
//     Locale('ar', ''), // لدعم العربية
//     // ...
//   ],
//   // ...
// );

// واستخدام direction: TextDirection.rtl في أماكن معينة أو بشكل عام، مع ترجمة النصوص للعربية.


// بهذا الشكل، تحصل على مشروع مبسط مكوّن من عدّة شاشات (مقسّمة في ملفات منفصلة) يطابق الفكرة والتصميم الأساسي المطلوب. يمكنك التعديل والإضافة حسب الحاجة. بالتوفيق!
