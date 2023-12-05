import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keuanganku/module/splash/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    ),
  );
}
