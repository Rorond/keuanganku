import 'package:keuanganku/core.dart';
import 'package:keuanganku/shared/widgets/form/c_textbox.dart';

class TxtJumlah extends StatelessWidget {
  const TxtJumlah({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return CTextbox(
      label: "Jumlah",
      controller: controller.jumlahController,
    );
  }
}
