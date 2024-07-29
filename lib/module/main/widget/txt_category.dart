import 'package:keuanganku/core.dart';

class TxtCategory extends StatelessWidget {
  const TxtCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return CTextbox(
      label: "Name",
      controller: controller.categoryFormController,
    );
  }
}
