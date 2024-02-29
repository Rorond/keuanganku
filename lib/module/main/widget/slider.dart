import 'package:carousel_slider/carousel_slider.dart';
import 'package:keuanganku/core.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: CarouselSlider(
        items: controller.carouselList,
        options: CarouselOptions(
          height: 400.0,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          // onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
