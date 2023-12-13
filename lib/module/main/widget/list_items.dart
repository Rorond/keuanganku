import 'package:keuanganku/core.dart';
import 'package:keuanganku/shared/pages/animation_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ListItems extends StatelessWidget {
  const ListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return SmartRefresher(
      controller: controller.refreshController,
      enablePullDown: true,
      enablePullUp: true,
      onRefresh: () {
        FocusScope.of(context).unfocus();
      },
      onLoading: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            controller.isLoading.value
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: const Center(child: CircularProgressIndicator()))
                : controller.cash.isNotEmpty
                    ? Column(
                        children: controller.cash.map(
                          (data) {
                            return Text(data.name.toString());
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
      ),
    );
  }
}
