import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controllers/ItemController.dart';
import 'View/HomePage.dart';

void main() {
  runApp(const MyApp());
  Get.put(ItemController(),permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      routes: {
        "/":(context) => HomePage()
      },
    );
  }
}


