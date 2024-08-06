String capitalizeFirstLetter(String input) {
  if (input.isEmpty) return input;
  return '${input[0].toUpperCase()}${input.substring(1).toLowerCase()}';
}

Map<String, String> splitDoubleToIntegerAndDecimal(double value) {
  String valueAsString = value.toStringAsFixed(2);

  List<String> parts = valueAsString.split('.');

  String integerPart = parts[0];
  String decimalPart = parts.length > 1 ? parts[1] : "00";

  String formattedIntegerPart = integerPart.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]},');

  return {
    'integerPart': formattedIntegerPart,
    'decimalPart': decimalPart,
  };
}

String doubleToIntegerMoney(double value) {
  String valueAsString = value.toStringAsFixed(2);

  List<String> parts = valueAsString.split('.');

  String integerPart = parts[0];
  String decimalPart = parts.length > 1 ? parts[1] : "00";

  String formattedIntegerPart = integerPart.replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]}');

  return '$formattedIntegerPart.$decimalPart';
}

String getInitials(String name, String lastName) {
  return '${name[0]}${lastName[0]}';
}

String getLastFourDigits(String value) {
  String lastFour = value.substring(value.length - 4);
  return '• $lastFour';
}
