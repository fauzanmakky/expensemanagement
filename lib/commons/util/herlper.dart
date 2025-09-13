class Helpers {
  Helpers._();
  static int validateNumber(String? valueInput) {
    int value = 0;
    if (valueInput != null && valueInput != "null" && valueInput != "") {
      value = double.parse(valueInput).round();
    }
    return value;
  }

  static double validateNumberDouble(String? valueInput,
      {double defaultValue = 0.0}) {
    if (isEmpty(valueInput)) {
      return roundSixNumberAfterComasDouble(defaultValue);
    }
    return roundSixNumberAfterComasDouble(
        double.tryParse(valueInput!) ?? defaultValue);
  }

  static bool isEmpty(text) {
    if (text == "" || text == null || text == "null") {
      return true;
    } else {
      return false;
    }
  }


  static double roundSixNumberAfterComasDouble(double text) {
    ///NOTE: round to 2 number after comas
    String _roundthreedecimal = text.toStringAsFixed(6);

    ///NOTE: add zero remover for 3.000 -> 3.0, 3.27000 -> 3.27, and round to 3 number after comas
    String _removeLongerDecimal = double.parse(_roundthreedecimal).toString();

    ///NOTE: remove zero after comas including its comas, ex: 3.0 -> 3, 2.2 -> 2.2
    return double.parse(
        _removeLongerDecimal.replaceAll(RegExp(r"([.]*0)(?!.*\d)"), ""));
  }
}