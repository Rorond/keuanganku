import 'package:keuanganku/core.dart';

class CTextbox extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const CTextbox({super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(
            label,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
              color: Colors.grey[300]!,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
              color: primaryColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
