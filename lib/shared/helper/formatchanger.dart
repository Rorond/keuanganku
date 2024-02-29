// ignore_for_file: non_constant_identifier_names

import 'package:intl/intl.dart';

class FormatChanger {
  double koordinat(String input) {
    var f = NumberFormat("###.########", "en_US");
    return double.parse(f.format(double.parse(input)));
  }

  String separator(String input) {
    var f = NumberFormat('#,##0.##', 'id');
    String hasil = f.format(int.parse(input.replaceAll(".0", "")));
    return hasil.replaceAll(",", ".");
  }

  String timeFromString(String input) {
    var f = DateFormat('HH:mm');
    return f.format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(input.toString()));
  }

  String tanggalAPI(DateTime input) {
    var f = DateFormat('yyyy-MM-dd');
    return f.format(DateFormat('yyyy-MM-dd').parse(input.toString()));
  }

  String tanggalAPIString(String input) {
    var f = DateFormat('yyyy-MM-dd');
    return f.format(DateFormat('dd-MM-yyyy').parse(input)).toString();
  }

  String tanggalIndo(DateTime input) {
    var f = DateFormat('dd MMM yyyy');
    return f.format(DateFormat('yyyy-MM-dd').parse(input.toString()));
  }

  String datetime(DateTime input) {
    var f = DateFormat('dd MMM yyyy HH:mm');
    return f.format(DateFormat('yyyy-MM-dd HH:mm').parse(input.toString()));
  }

  String tglIndo(DateTime input) {
    var f = DateFormat('dd/MM/yyyy');
    return f.format(DateFormat('yyyy-MM-dd').parse(input.toString()));
  }

  String BulanIndo(DateTime input) {
    var f = DateFormat('MMMM yyyy');
    return f.format(DateFormat('yyyy-MM').parse(input.toString()));
  }

  String tanggalIndoFromString(String input) {
    var f = DateFormat('dd-MM-yyyy');
    return f.format(DateFormat('yyyy-MM-dd').parse(input.toString()));
  }

  String tanggalJam(DateTime input) {
    var f = DateFormat('dd-MM-yyyy HH:mm');
    return f.format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(input.toString()));
  }

  String timeFromDate(DateTime input) {
    var f = DateFormat('HH:mm');
    return f.format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(input.toString()));
  }

  String day(DateTime input) {
    var f = DateFormat('dd');
    return f.format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(input.toString()));
  }

  String month(DateTime input) {
    var f = DateFormat('MM');
    return f.format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(input.toString()));
  }

  String year(DateTime input) {
    var f = DateFormat('yyyy');
    return f.format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(input.toString()));
  }
}
