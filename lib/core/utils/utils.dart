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

class DateTimeFormatter {
  static String format(DateTime dateTime) {
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString();
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    return '$day/$month/$year $hour:$minute';
  }
}
