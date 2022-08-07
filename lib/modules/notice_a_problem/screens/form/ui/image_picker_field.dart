import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/error_texts.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ImagePickerField extends StatelessWidget {
  const ImagePickerField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderImagePicker(
        name: 'ImagePicker',
        initialValue: [],
        maxImages: 3,
        placeholderImage: AssetImage('assets/images/add-image.png'),
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(errorText: errorRequired),
          ],
        ));
  }
}
