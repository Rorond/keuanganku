import 'package:keuanganku/core.dart';

class CustomCombobox<T> extends StatelessWidget {
  final String label;
  final T? selectedValue;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String addButtonLabel;
  const CustomCombobox({
    super.key,
    required this.label,
    this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.addButtonLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              12.0,
            ),
          ),
        ),
        child: FormField(
          initialValue: false,
          enabled: true,
          builder: (FormFieldState<bool> field) {
            return DropdownButtonFormField<T>(
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
              value: selectedValue,
              onChanged: onChanged,
              items: items.map<DropdownMenuItem<T>>((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: value.toString() != addButtonLabel
                      ? Text(
                          value.toString(),
                          style: GoogleFonts.lato(),
                        )
                      : Center(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            decoration: const BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 40,
                            child: Center(
                              child: Text(
                                value.toString(),
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                );
              }).toList(),
            );
          },
        ));
  }
}
