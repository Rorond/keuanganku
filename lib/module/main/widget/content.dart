import 'package:keuanganku/core.dart';
import 'package:keuanganku/module/main/widget/header.dart';
import 'package:keuanganku/module/main/widget/list_items.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 24,
      right: 24,
      top: 100,
      bottom: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const Header(),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: const ListItems(),
            )
          ],
        ),
      ),
    );
  }
}
