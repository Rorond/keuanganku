import 'package:keuanganku/core.dart';
import 'package:keuanganku/models/category/category.dart';
import 'package:keuanganku/module/main/widget/txt_category.dart';

class FormCategory extends StatelessWidget {
  final String label;
  const FormCategory({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return Container(
      // padding: const EdgeInsets.all(10.0),
      // height: 100,
      color: Colors.black.withOpacity(0.4),
      child: Center(
        child: Card(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                SingleChildScrollView(
                  controller: ScrollController(),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: GoogleFonts.lato(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const TxtCategory(),
                        const SizedBox(height: 30),
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
                                    CategoryModel category = CategoryModel(
                                      id: UniqueKey().hashCode,
                                      name: controller
                                          .categoryFormController.text,
                                    );

                                    controller.addCategory(category);
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
