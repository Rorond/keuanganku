// ignore_for_file: invalid_use_of_protected_member

import 'package:keuanganku/core.dart';
import 'package:keuanganku/models/cash/cash.dart';
import 'package:keuanganku/module/main/widget/form_dialog.dart';
import 'package:keuanganku/shared/helper/formatchanger.dart';
import 'package:keuanganku/shared/pages/animation_page.dart';

class ListItems extends StatelessWidget {
  final RxList<Cash> items;
  const ListItems({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          controller.isLoading.value
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : items.isNotEmpty
                  ? Column(
                      children: items.map(
                        (data) {
                          return InkWell(
                            onTap: () {
                              controller.labelController.text =
                                  data.name.toString();
                              controller.descriptionController.text =
                                  data.description.toString();
                              controller.jumlahController.text =
                                  data.jumlah.toString();
                              controller.dateController.text = FormatChanger()
                                  .tanggalJam(
                                      DateTime.parse(data.date.toString()));
                              showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return FormDialog(
                                    label: data.status == "In"
                                        ? "Update Uang Masuk"
                                        : "Update Uang Keluar",
                                    id: data.id,
                                  );
                                },
                              );
                            },
                            child: Dismissible(
                              key: UniqueKey(),
                              onDismissed: (detail) {},
                              confirmDismiss: (direction) async {
                                bool confirm = false;
                                await showDialog<void>(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Confirm'),
                                      content: const SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Text(
                                                'Are you sure you want to delete this item?'),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        SizedBox(
                                          width: 300,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: SizedBox(
                                                  height: 35,
                                                  child: OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      foregroundColor:
                                                          primaryColor,
                                                      side: BorderSide(
                                                        color: primaryColor,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: Text(
                                                      "No",
                                                      style: GoogleFonts.lato(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 15),
                                              Expanded(
                                                child: SizedBox(
                                                  height: 35,
                                                  child: OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          primaryColor,
                                                      foregroundColor:
                                                          Colors.white,
                                                      side: BorderSide(
                                                        color: primaryColor,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      confirm = true;
                                                      controller.delete(data);
                                                      Get.back();
                                                    },
                                                    child: Text(
                                                      "Yes",
                                                      style: GoogleFonts.lato(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (confirm) {
                                  return Future.value(true);
                                }
                                return Future.value(false);
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.1),
                                ),
                                child: ListTile(
                                  title: Text(
                                    data.name.toString(),
                                    style: GoogleFonts.lato(),
                                  ),
                                  subtitle: Text(
                                    FormatChanger().datetime(
                                      DateTime.parse(
                                        data.date.toString(),
                                      ),
                                    ),
                                    style: GoogleFonts.lato(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  trailing: Text(
                                    data.status == "In"
                                        ? "+ Rp ${FormatChanger().separator(data.jumlah.toString())}"
                                        : "- Rp ${FormatChanger().separator(data.jumlah.toString())}",
                                    style: GoogleFonts.lato(
                                      color: data.status == "In"
                                          ? Colors.green
                                          : Colors.red,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    )
                  : AnimationPage(
                      animationJson: "no_data.json",
                      label: "Tidak ada data keuangan",
                      height: MediaQuery.of(context).size.height * 0.5,
                    )
        ],
      ),
    );
  }
}
