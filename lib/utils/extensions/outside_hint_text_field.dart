import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_utils/get_utils.dart';

extension OutsideHintTextField on FormBuilderTextField {
  Widget outside(String text) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  text.tr,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              FormBuilderTextField(
                name: name,
                initialValue: initialValue,
                validator: validator,
                keyboardType: keyboardType,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: decoration.labelText,
                  suffixIcon: decoration.suffixIcon,
                ),
                onChanged: onChanged,
                maxLines: maxLines,
                obscureText: obscureText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
