import 'package:keuanganku/core.dart';
import 'package:keuanganku/models/category/category.dart';
import 'package:keuanganku/module/main/widget/form_category.dart';
import 'package:keuanganku/shared/widgets/form/c_combobox.dart';

class CboCategory extends StatelessWidget {
  const CboCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    controller.setButtonAddCategory();
    return CustomCombobox<CategoryModel>(
      label: 'Category',
      selectedValue: null,
      addButtonLabel: "Add New Category",
      items: controller.categories,
      onChanged: (value) {
        if (value!.name == "Add New Category") {
          Get.back();
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return const FormCategory(
                label: "Add New Category",
              );
            },
          );
        } else {
          controller.categoryController.text = value.name ?? "";
        }
      },
    );
  }
}
