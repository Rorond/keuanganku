import 'package:get/get.dart';
import 'package:keuanganku/core.dart';

class SplashController extends GetxController {
  SplashView? view;

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 2))
        .then((value) => Get.offAll(const MainView()));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
