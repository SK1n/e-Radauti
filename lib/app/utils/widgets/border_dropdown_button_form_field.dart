import 'package:flutter/material.dart';

class BorderDropdownButtonFormField extends StatelessWidget {
  final String hint;
  final String? errorText;
  final Function(String? value) onChanged;
  final Map<String, String> items;
  final String? Function(String? value)? validator;
  const BorderDropdownButtonFormField({
    super.key,
    required this.hint,
    required this.onChanged,
    required this.items,
    this.errorText,
    this.validator,
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
          DropdownButtonFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              errorText: errorText,
            ),
            validator: validator,
            items: items.entries
                .map((entry) => DropdownMenuItem(
                      value: entry.key,
                      child: Text(entry.value),
                    ))
                .toList(),
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
