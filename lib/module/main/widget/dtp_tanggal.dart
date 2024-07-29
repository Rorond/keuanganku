import 'package:intl/intl.dart';
import 'package:keuanganku/core.dart';

class DtpTanggal extends StatelessWidget {
  const DtpTanggal({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return InkWell(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        DateTime currentTime = DateTime.now();
        pickedDate = DateTime(
          pickedDate!.year,
          pickedDate.month,
          pickedDate.day,
          currentTime.hour,
          currentTime.minute,
        );
        String formattedDate =
            DateFormat('yyyy-MM-dd HH:mm').format(pickedDate);

        controller.dateController.text = formattedDate;
      },
      child: TextFormField(
        controller: controller.dateController,
        enabled: false,
        decoration: InputDecoration(
          label: const Text(
            'Date',
          ),
          suffixIcon: const Icon(Icons.calendar_month),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
              color: Colors.grey[300]!,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
              color: primaryColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }
}
