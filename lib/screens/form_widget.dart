import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const FormWidget({Key? key, required this.controller, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'enter valid input';
        } else {
          return null;
        }
      },
    );
  }
}
