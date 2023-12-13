import 'package:keuanganku/core.dart';
import 'package:keuanganku/shared/widgets/form/c_textbox.dart';

class TxtLabel extends StatelessWidget {
  const TxtLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return CTextbox(
      label: "Label",
      controller: controller.labelController,
    );
  }
}
