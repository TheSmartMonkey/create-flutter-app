import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final int? maxLength;
  final Function(String?)? validator;
  final Function()? onEditingComplete;

  const CustomInput({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    this.maxLength,
    this.validator,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  valide(value) {
    if (value == null || value.isEmpty) {
      return 'Entre text';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hint,
            labelText: widget.label,
          ),
          maxLength: widget.maxLength,
          validator: (value) => widget.validator ?? valide(value),
          onEditingComplete: () => widget.onEditingComplete,
        ),
      ),
    );
  }
}
