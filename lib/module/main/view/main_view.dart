
  import 'package:flutter/material.dart';
  import '../controller/main_controller.dart';
  import 'package:keuanganku/core.dart';
  import 'package:get/get.dart';
  
  class MainView extends StatelessWidget {
    const MainView({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return GetBuilder<MainController>(
        init: MainController(),
        builder: (controller) {
          controller.view = this;
  
          return Scaffold(
            appBar: AppBar(
              title: const Text("Main"),
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
    