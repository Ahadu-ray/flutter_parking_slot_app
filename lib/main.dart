import 'package:flutter/material.dart';
import 'package:flutter_parking_spot_mobile_app/ui/bindings/init_bindings.dart';
import 'package:flutter_parking_spot_mobile_app/ui/pages/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      initialBinding: InitBindings(),
    );
  }
}
