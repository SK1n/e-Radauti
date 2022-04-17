import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/send_button.dart';
import 'package:flutterapperadauti/strings/form.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class ImagePickerField extends StatelessWidget {
  const ImagePickerField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderImagePicker(
        enabled: !Provider.of<SendButtonLoadingState>(context).isLoading,
        name: 'image',
        initialValue: [],
        maxImages: 3,
        decoration: InputDecoration(
            errorText: Provider.of<SendButtonLoadingState>(context).isLoading
                ? 'Nu se poate selecta o poza in timp ce se incarca locatia!'
                : null,
            label: AutoSizeText(
              'Pentru o verificare mai ușoară, vă rugăm să încărcați și cel puțin o imagine',
              style: TextStyle(fontSize: 20),
              maxLines: 2,
            )),
        placeholderImage: AssetImage('assets/images/add-image.png'),
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(errorText: errorRequired),
          ],
        ));
  }
}

class DownloadableList extends ChangeNotifier {
  List<String> _list = [];
  List<String> get list => _list;

  Future<void> addLink(String link) async {
    _list.add(link);
    notifyListeners();
  }

  void deleteList() {
    _list = [];
    notifyListeners();
  }
}
