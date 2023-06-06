import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_utils/get_utils.dart';

extension OutsideHintTextField on FormBuilderSwitch {
  Widget outside(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormBuilderSwitch(
        name: name,
        initialValue: initialValue,
        validator: validator,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: decoration.labelText,
          suffixIcon: decoration.suffixIcon,
        ),
        onChanged: onChanged,
        title: title,
      ),
    );
  }
}
