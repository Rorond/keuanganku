import 'package:keuanganku/core.dart';
import 'package:keuanganku/shared/widgets/form/c_number_field.dart';

class TxtJumlah extends StatelessWidget {
  const TxtJumlah({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return CNumberField(
      label: "Rp",
      controller: controller.jumlahController,
    );
  }
}
