import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get_utils/get_utils.dart';

class HintTextField extends StatelessWidget {
  final String? name;
  final String? hint;
  final String? Function(String?)? validator;

  const HintTextField({
    super.key,
    this.name,
    this.validator,
    this.hint,
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
              hint?.tr ?? "",
              style: const TextStyle(fontSize: 14),
            ),
          ),
          FormBuilderTextField(
            name: name ?? "",
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            initialValue: '',
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
