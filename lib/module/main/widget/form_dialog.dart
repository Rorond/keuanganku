import 'package:keuanganku/core.dart';
import 'package:keuanganku/models/cash/cash.dart';
import 'package:keuanganku/module/main/widget/dtp_tanggal.dart';
import 'package:keuanganku/module/main/widget/cbo_category.dart';
import 'package:keuanganku/module/main/widget/txt_jumlah.dart';
import 'package:keuanganku/module/main/widget/txt_label.dart';
import 'package:keuanganku/shared/helper/formatchanger.dart';

class FormDialog extends StatelessWidget {
  final String label;
  final int? id;
  const FormDialog({super.key, required this.label, this.id});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return Container(
      color: Colors.black.withOpacity(0.4),
      child: Center(
        child: Card(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            // height: MediaQuery.of(context).size.height * 0.6,
            child: Wrap(
              children: [
                SingleChildScrollView(
                  controller: ScrollController(),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    width: MediaQuery.of(context).size.width,
                    // height: MediaQuery.of(context).size.height * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  label,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  children: [
                                    const TxtLabel(),
                                    const SizedBox(height: 15),
                                    const DtpTanggal(),
                                    const SizedBox(height: 15),
                                    label == "Input Uang Masuk" ||
                                            label == "Update Uang Masuk"
                                        ? const SizedBox(height: 0)
                                        : const CboCategory(),
                                    label == "Input Uang Masuk" ||
                                            label == "Update Uang Masuk"
                                        ? const SizedBox(height: 0)
                                        : const SizedBox(height: 15),
                                    const TxtJumlah(),
                                    const SizedBox(height: 15)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    foregroundColor: secondaryColor,
                                    side: BorderSide(
                                      color: secondaryColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    "Batal",
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    foregroundColor: Colors.white,
                                    side: BorderSide(
                                      color: secondaryColor,
                                    ),
                                  ),
                                  onPressed: () async {
                                    Cash value = Cash(
                                      name: controller.labelController.text,
                                      jumlah: double.parse(controller
                                          .jumlahController.text
                                          .replaceAll(",", "")),
                                      category:
                                          controller.categoryController.text,
                                      date: label == "Update Uang Masuk" ||
                                              label == "Update Uang Keluar"
                                          ? DateTime.parse(
                                              FormatChanger().tanggalAPIString(
                                                  controller
                                                      .dateController.text),
                                            )
                                          : DateTime.parse(
                                              controller.dateController.text,
                                            ),
                                      imageUrl: "-",
                                      description:
                                          controller.descriptionController.text,
                                      id: id ?? UniqueKey().hashCode,
                                      status: label == "Update Uang Masuk" ||
                                              label == "Input Uang Masuk"
                                          ? "In"
                                          : "Out",
                                    );
                                    if (label == "Input Uang Keluar") {
                                      await controller.add(value);
                                    } else if (label == "Input Uang Masuk") {
                                      await controller.add(value);
                                    } else if (label == "Update Uang Keluar") {
                                      await controller.edit(value);
                                    } else if (label == "Update Uang Masuk") {
                                      await controller.edit(value);
                                    }

                                    Get.back();
                                  },
                                  child: Text(
                                    "Simpan",
                                    style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
