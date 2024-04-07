import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataPicker {
  final BuildContext context;
  final DateTime selectedDate;
  final String dateFormat;

  DataPicker({
    required this.context,
    this.dateFormat = 'dd-MMM-yyyy',
  }) : selectedDate = DateTime.now();

  Future<void> showCustomDatePicker(Function(String) onDataSelection) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      onDataSelection(_getDate(picked));
    }
  }

  String _getDate(DateTime picked) {
    return DateFormat(dateFormat).format(picked);
  }
}
