import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:keuanganku/core.dart';
import 'package:keuanganku/models/cash/cash_adapter.dart';
import 'package:keuanganku/models/category/category_adapter.dart';
import 'package:keuanganku/shared/theme/theme.dart';
import 'package:keuanganku/shared/theme/theme_dark.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    var path = await getTemporaryDirectory();
    Hive.init(path.path);
  }
  Hive.registerAdapter(CashAdapter());
  Hive.registerAdapter(CategoryAdapter());
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
