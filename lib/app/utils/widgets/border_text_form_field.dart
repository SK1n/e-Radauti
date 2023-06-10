import 'package:flutter/material.dart';

class BorderTextFormField extends StatelessWidget {
  final String hint;
  final Function(String value) onChanged;
  final String? initialValue;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  const BorderTextFormField({
    super.key,
    required this.hint,
    required this.onChanged,
    this.obscureText,
    this.keyboardType,
    this.initialValue,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              hint,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          TextFormField(
            initialValue: initialValue,
            onChanged: onChanged,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              errorText: errorText,
            ),
          )
        ],
      ),
    );
  }
}
