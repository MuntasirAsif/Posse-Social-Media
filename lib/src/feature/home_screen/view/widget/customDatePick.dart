import 'package:flutter/material.dart';

// ignore: unused_element
Future<void> selectDate(BuildContext context) async {
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF6C8A55), 
            onPrimary: Colors.white,    
            onSurface: Colors.black,  
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Color(0xFF6C8A55), 
            ),
          ),
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  if (selectedDate != null) {
    // ignore: avoid_print
    print("Selected date: $selectedDate");
  }
}
