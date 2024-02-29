import 'package:intl/intl.dart';
import 'package:keuanganku/core.dart';
import 'package:keuanganku/models/bar/bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarCart extends StatelessWidget {
  const BarCart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return Card(
      child: Container(
        height: 180,
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
        child: SfCartesianChart(
          title: ChartTitle(
              text: 'Pengeluaran Seminggu Terakhir',
              textStyle: GoogleFonts.lato(
                fontSize: 12,
              )),
          primaryXAxis: const CategoryAxis(),
          primaryYAxis: NumericAxis(
            title: const AxisTitle(),
            numberFormat: NumberFormat.currency(
              locale: 'id',
              symbol: 'Rp ',
              decimalDigits: 0,
              name: "IDR",
            ),
          ),
          series: <ColumnSeries<BarData, String>>[
            // Mengganti BarSeries menjadi ColumnSeries
            ColumnSeries<BarData, String>(
              dataSource: controller.barData,
              xValueMapper: (BarData data, _) => data.day,
              yValueMapper: (BarData data, _) => data.expense,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
