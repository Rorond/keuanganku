import 'package:keuanganku/core.dart';
import 'package:keuanganku/models/pie/pie.dart';
import 'package:keuanganku/shared/helper/formatchanger.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatelessWidget {
  const PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return Card(
      child: Container(
          height: MediaQuery.of(context).size.height * 0.20,
          padding: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.1),
                blurRadius: 24,
                offset: const Offset(0, 14),
              ),
            ],
            color: Theme.of(context).colorScheme.background.withOpacity(0.8),
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          child: Obx(
            () => Center(
              child: Column(
                children: [
                  Text(
                    FormatChanger().BulanIndo(DateTime.now()),
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 130,
                          child: Center(
                            child: SfCircularChart(
                              series: <DoughnutSeries<PieData, String>>[
                                DoughnutSeries<PieData, String>(
                                  explode: true,
                                  explodeIndex: 0,
                                  dataSource: controller.pieData,
                                  xValueMapper: (PieData data, _) => data.xData,
                                  yValueMapper: (PieData data, _) => data.yData,
                                  dataLabelMapper: (PieData data, _) =>
                                      data.text,
                                  // dataLabelSettings:
                                  //     DataLabelSettings(isVisible: true),
                                  pointColorMapper: (PieData data, _) =>
                                      data.color,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Income :"),
                                  Text(
                                    "Rp ${FormatChanger().separator(
                                      controller.totalIncome.value.toString(),
                                    )}",
                                    style: GoogleFonts.lato(
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Expenses :"),
                                  Text(
                                    "Rp ${FormatChanger().separator(
                                      controller.totalOutCome.value.toString(),
                                    )}",
                                    style: GoogleFonts.lato(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Saldo :"),
                                  Text(
                                    "Rp ${FormatChanger().separator(
                                      (controller.totalIncome.value -
                                              controller.totalOutCome.value)
                                          .toString(),
                                    )}",
                                    style: GoogleFonts.lato(
                                      color: Colors.green,
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
                ],
              ),
            ),
          )),
    );
  }
}
