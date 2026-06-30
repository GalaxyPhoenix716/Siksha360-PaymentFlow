class NumberFormatter {
  static String format(num amount) {
    final isInteger = amount % 1 == 0;

    if (isInteger) {
      return _addCommas(amount.toInt().toString());
    } else {
      final String formattedString = amount.toStringAsFixed(2);
      final List<String> parts = formattedString.split('.');
      final String integerPart = _addCommas(parts[0]);
      final String decimalPart = parts[1];

      if (decimalPart == '00') {
        return integerPart;
      }

      return '$integerPart.$decimalPart';
    }
  }

  static String _addCommas(String value) {
    final RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    return value.replaceAllMapped(reg, (Match m) => '${m[1]},');
  }
}
