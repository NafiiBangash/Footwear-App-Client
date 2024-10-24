import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final int? maxLines;
  final TextEditingController controller;
  final TextInputType? textInputType;
  const MyTextField({super.key, required this.label,
    this.maxLines = 1, required this.controller,
    this.textInputType
  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: label,
      ),
      maxLines: maxLines,
    );
  }
}
