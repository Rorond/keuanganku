import 'package:keuanganku/core.dart';

class TxtLabel extends StatelessWidget {
  const TxtLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return CTextbox(
      label: "Name",
      controller: controller.labelController,
    );
  }
}
