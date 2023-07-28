import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controllers/Api.dart';
import 'Controllers/ItemController.dart';
import 'View/HomePage.dart';

void main() {
  runApp(const MyApp());
  Get.put(ItemController(),permanent: true);
  Api api = Api();
  print(api.getFilters());
  print(api.searchModel("Apple iPhone 12"));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/":(context) => HomePage()
      },
    );
  }
}


