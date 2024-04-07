import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Function(String)? onChange;
  final Function()? onTap;
  final bool enable;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.onChange,
    this.onTap,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: !enable,
      controller: controller,
      onChanged: onChange,
      onTap: onTap,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        labelText: hint,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
