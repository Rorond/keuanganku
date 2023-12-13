import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:keuanganku/core.dart';
import 'package:keuanganku/shared/theme/theme.dart';
import 'package:keuanganku/shared/theme/theme_dark.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    var path = await getTemporaryDirectory();
    Hive.init(path.path);
  }
  mainStorage = await Hive.openBox('mainStorage');

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getDefaultTheme(),
      darkTheme: getDarkTheme(),
      home: const SplashView(),
    ),
  );
}
