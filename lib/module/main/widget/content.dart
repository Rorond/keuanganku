import 'package:keuanganku/core.dart';
import 'package:keuanganku/module/main/widget/slider.dart';
import 'package:keuanganku/module/main/widget/tab_bar.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 24,
      right: 24,
      top: 100,
      bottom: 0,
      child: Column(
        children: [
          const SliderWidget(),
          const SizedBox(height: 20),
          SingleChildScrollView(
            controller: ScrollController(),
            child: TabBarMain(),
          ),
        ],
      ),
    );
  }
}
