import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/utils/error_texts.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class Item {
  final String name;
  final Icon icon;
  final int index;
  const Item(this.name, this.icon, this.index);
}

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List itemList = [
      ['Altele', 1],
      ['Gunoi neridicat', 2],
      ['Infrastructură', 3],
      ['Probleme la utilitati', 4],
      ['Constructii ilegale', 5],
      ['Siguranta', 6],
      ['Calitatea aerului si poluare', 7],
    ];
    return FormBuilderDropdown(
      name: 'category',
      itemHeight: 80,
      hint: Text('Alegeti o categorie de sesizare'),
      items: itemList
          .map((item) => DropdownMenuItem(
                value: item[0],
                child: Text('${item[0]}'),
              ))
          .toList(),
      validator: FormBuilderValidators.compose(
          [FormBuilderValidators.required(errorText: errorRequired)]),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
