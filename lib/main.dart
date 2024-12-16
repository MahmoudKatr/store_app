import 'package:flutter/material.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // This will remove the debug banner
      routes: {
        // تعريف خريطة المسارات (الصفحات) داخل التطبيق.
        HomePage.id: (context) =>
            const HomePage(), // تعريف المسار الخاص بـ HomePage باستخدام المعرف id.
        UpdatePage.id: (context) => UpdatePage(),
      },
      initialRoute:
          HomePage.id, // تحديد الصفحة التي سيتم فتحها عند بدء تشغيل التطبيق.
    );
  }
}
