
  import 'package:flutter/material.dart';
  import '../controller/splash_controller.dart';
  import 'package:keuanganku/core.dart';
  import 'package:get/get.dart';
  
  class SplashView extends StatelessWidget {
    const SplashView({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller) {
          controller.view = this;
  
          return Scaffold(
            appBar: AppBar(
              title: const Text("Splash"),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: const [],
                ),
              ),
            ),
          );
        },
      );
    }
  }
    