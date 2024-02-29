import 'package:keuanganku/core.dart';

class TabBarMain extends StatelessWidget {
  const TabBarMain({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());

    return Obx(
      () => SizedBox(
        height: MediaQuery.of(context).size.height * 0.65,
        child: DefaultTabController(
          length: controller.tabs.length,
          // initialIndex: controller.tabs.length - 1,
          child: Column(
            children: [
              SizedBox(
                height: 35,
                child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.grey.shade500,
                  labelColor: Colors.white,
                  labelStyle: GoogleFonts.lato(fontSize: 14),
                  unselectedLabelStyle: GoogleFonts.lato(fontSize: 14),
                  tabs: controller.tabs,
                  indicatorWeight: 0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                  dividerHeight: 0,
                  automaticIndicatorColorAdjustment: true,
                  indicatorPadding: const EdgeInsets.all(0),
                  tabAlignment: TabAlignment.center,
                  padding: EdgeInsets.zero,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                // height: 150,
                child: TabBarView(
                  children: controller.pageViews,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
