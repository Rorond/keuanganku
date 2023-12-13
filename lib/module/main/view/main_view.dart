import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:keuanganku/core.dart';
import 'package:keuanganku/module/main/widget/appbar.dart';
import 'package:keuanganku/module/main/widget/content.dart';
import 'package:keuanganku/module/main/widget/form_dialog.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) {
        controller.view = this;

        return WillPopScope(
          onWillPop: () async {
            if (controller.isOpen.value) {
              return true;
            } else {
              controller.setIsOpen();
              return false;
            }
          },
          child: Scaffold(
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Stack(
                  children: [
                    MyAppBar(),
                    Content(),
                  ],
                ),
              ),
              floatingActionButton: Obx(() {
                return SpeedDial(
                  backgroundColor: primaryColor,
                  spacing: 15,
                  icon: controller.isOpen.value ? Icons.close : Icons.add,
                  onOpen: controller.setIsOpen,
                  onClose: controller.setIsOpen,
                  children: [
                    SpeedDialChild(
                      backgroundColor: dangerColor,
                      label: "Uang Keluar",
                      child: const Icon(Icons.money_off_outlined),
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return const FormDialog(
                              label: "Input Uang Keluar",
                            );
                          },
                        );
                      },
                    ),
                    SpeedDialChild(
                        backgroundColor: successColor,
                        label: "Uang Masuk",
                        child: const Icon(Icons.monetization_on_outlined)),
                  ],
                );
              })),
        );
      },
    );
  }
}
