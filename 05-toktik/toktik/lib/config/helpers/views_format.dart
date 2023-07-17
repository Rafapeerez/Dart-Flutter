//Using intl

import 'package:intl/intl.dart';

class ViewsFormat {
  //Static for dont hace to create an instance to call methods
  static String viewsNumber(double number) {
    
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);

    return formatterNumber;
  }
}
