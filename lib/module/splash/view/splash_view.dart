import 'package:keuanganku/core.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
            body: Center(
          // child: Stack(children: [
          //   Center(
          //     child: Container(
          //       padding: const EdgeInsets.all(10.0),
          //       decoration: BoxDecoration(
          //         color: primaryColor.withOpacity(0.2),
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(100.0),
          //         ),
          //       ),
          //       //
          //       child: Image.asset(
          //         'assets/icon/icon.png',
          //         fit: BoxFit.cover,
          //         width: 50,
          //         height: 50,
          //         // color: primaryColor,
          //       ),
          //     ),
          //   ),
          //   Center(
          //     child: Positioned(
          //       // top: 10,
          //       // left: 10,
          //       child: Container(
          //         height: 70,
          //         width: 70,
          //         child: CircularProgressIndicator(
          //           color: primaryColor,
          //           strokeWidth: 1,
          //         ),
          //       ),
          //     ),
          //   )
          // ]),

          child: CircularProgressIndicator(
            color: primaryColor,
            strokeWidth: 2,
          ),
        ));
      },
    );
  }
}
