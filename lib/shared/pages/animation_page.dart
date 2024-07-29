import 'package:keuanganku/core.dart';

class AnimationPage extends StatelessWidget {
  final String animationJson;
  final String label;
  final double height;
  const AnimationPage({
    super.key,
    required this.animationJson,
    required this.height,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/lottie/$animationJson",
            width: 150,
            height: 150,
          ),
          Text(
            label,
            style: GoogleFonts.lato(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
