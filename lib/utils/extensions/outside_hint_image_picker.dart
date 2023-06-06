import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:get/get_utils/get_utils.dart';

extension OutsideHintTextField on FormBuilderImagePicker {
  Widget outside(String text) {
    return Padding(
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
          FormBuilderImagePicker(
            name: name,
            initialValue: initialValue,
            validator: validator,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: decoration.labelText,
              suffixIcon: decoration.suffixIcon,
            ),
            maxImages: 3,
            placeholderWidget: placeholderWidget,
            previewMargin: previewMargin,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
