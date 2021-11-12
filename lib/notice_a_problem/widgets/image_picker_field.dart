import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/strings/form.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ImagePickerField extends StatelessWidget {
  const ImagePickerField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderImagePicker(
        name: 'image',
        maxImages: 3,
        decoration: InputDecoration(
            labelText:
                'Pentru o verificare mai ușoară, vă rugăm să încărcați și cel puțin o imagine'),
        placeholderImage: AssetImage('assets/images/icons8-plus-64.png'),
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(context, errorText: errorRequired),
          ],
        ));
  }
}

class DownloadableList extends ChangeNotifier {
  List<String> _list = [];
  List<String> get list => _list;

  Future<void> addLink(String link) async {
    _list.add(link);
    printList();
    notifyListeners();
  }

  void deleteList() {
    _list = [];
    printList();
    notifyListeners();
  }

  void printList() {
    debugPrint('Downloadable List: $_list');
  }
}
