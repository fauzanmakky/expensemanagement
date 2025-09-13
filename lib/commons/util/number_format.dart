import 'dart:math';

import 'package:expensemanagement/commons/util/herlper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

abstract class FormatNumber implements NumberFormat{

  static String currency(
      String? number, {
        bool usePrefix = true,
        bool isForceToInt = false,
        int decimalDigits = 2,
      }) {
    final nums = Helpers.validateNumberDouble(number);
    final format = NumberFormat('#,###', 'id-ID');
    if (!isForceToInt) {
      format.maximumFractionDigits = decimalDigits;
    } else {
      format.maximumFractionDigits = 0;
    }
    String value = format.format(nums);
    return '${usePrefix ? 'Rp ' : ''}$value';
  }
}





class ThousandsInputFormatter extends TextInputFormatter {
  final NumberFormat _fmt;

  /// locale default 'id_ID' -> grouping separator '.' and no decimal
  ThousandsInputFormatter({String locale = 'id_ID'}) : _fmt = NumberFormat.decimalPattern(locale);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Jika kosong -> langsung return
    if (newValue.text.isEmpty) return newValue.copyWith(text: '');

    // Hanya ambil digit (hilangkan titik, spasi, koma, dll)
    final digitsOnly = _getOnlyDigits(newValue.text);

    // Jika tidak ada digit, kembalikan kosong
    if (digitsOnly.isEmpty) return const TextEditingValue(text: '');

    // Parse ke int (gunakan BigInt untuk aman bagi angka sangat besar)
    final numeric = int.tryParse(digitsOnly) ?? 0;

    // Format ke string dengan separator ribuan sesuai locale
    final newText = _fmt.format(numeric);

    // Hitung caret position baru:
    // dasar: posisi relatif terhadap jumlah digit sebelum caret
    final oldDigitsBeforeCaret = _countDigitsBeforeCaret(newValue.text, newValue.selection.end);
    // setelah format, cari posisi caret supaya berada setelah jumlah digit yang sama
    final newCaretPosition = _calculateCaretPositionFromDigitIndex(newText, oldDigitsBeforeCaret);

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newCaretPosition),
    );
  }

  String _getOnlyDigits(String input) {
    return input.replaceAll(RegExp(r'[^0-9]'), '');
  }

  int _countDigitsBeforeCaret(String text, int caretIndex) {
    int count = 0;
    for (int i = 0; i < caretIndex && i < text.length; i++) {
      if (RegExp(r'[0-9]').hasMatch(text[i])) count++;
    }
    return count;
  }

  int _calculateCaretPositionFromDigitIndex(String formattedText, int digitIndex) {
    // iterate formattedText and count digits until reach digitIndex
    int digitsSeen = 0;
    for (int i = 0; i < formattedText.length; i++) {
      if (RegExp(r'[0-9]').hasMatch(formattedText[i])) {
        digitsSeen++;
        if (digitsSeen == digitIndex) {
          return i + 1; // caret after this digit
        }
      }
    }
    // if requested digitIndex greater than digits available, put caret at end
    return formattedText.length;
  }
}