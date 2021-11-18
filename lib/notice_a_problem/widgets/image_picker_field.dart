import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/notice_a_problem/widgets/send_button.dart';
import 'package:flutterapperadauti/strings/form.dart';
import 'package:flutterapperadauti/widgets/src/loading_screen_ui.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class ImagePickerField extends StatelessWidget {
  const ImagePickerField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderImagePicker(
        enabled: !Provider.of<SendButtonLoadingState>(context).isLoading,
        name: 'image',
        loadingWidget: (BuildContext context) => LoadingScreen(),
        maxImages: 3,
        decoration: InputDecoration(
            errorText: Provider.of<SendButtonLoadingState>(context).isLoading
                ? 'Nu se poate selecta o poza in timp ce se incarca locatia!'
                : null,
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
