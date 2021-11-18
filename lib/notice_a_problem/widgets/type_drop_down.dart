import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/state/notice_problem_state.dart';
import 'package:flutterapperadauti/strings/form.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class Item {
  final String name;
  final Icon icon;
  final int index;
  const Item(this.name, this.icon, this.index);
}

class TypeDropDown extends StatelessWidget {
  const TypeDropDown({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoticeFormState noticeFormState = Provider.of<NoticeFormState>(context);
    List itemList = [
      'Altele',
      'Gunoi neridicat',
      'Infrastructură',
      'Probleme la utilitati',
      'Constructii ilegale',
      'Siguranta',
      'Calitatea aerului si poluare',
    ];
    return FormBuilderDropdown(
      name: 'TypeDropDown',
      itemHeight: 80,
      initialValue: noticeFormState.category,
      hint: Text('Alegeti o categorie de sesizare'),
      items: itemList
          .map((item) => DropdownMenuItem(
                value: item,
                child: Text('$item'),
              ))
          .toList(),
      validator: FormBuilderValidators.compose(
          [FormBuilderValidators.required(context, errorText: errorRequired)]),
      onChanged: (value) {
        noticeFormState.upTypeName(value);
        noticeFormState.upIndex(returnIndex(value));
      },
    );
  }
}

int returnIndex(String text) {
  switch (text) {
    case 'Altele':
      return 0;

      break;
    case 'Gunoi neridicat':
      return 1;
      break;
    case 'Infrastructură':
      return 2;
      break;
    case 'Probleme la utilitati':
      return 3;
      break;
    case 'Constructii ilegale':
      return 4;
      break;
    case 'Siguranta':
      return 5;
      break;
    case 'Calitatea aerului si poluare':
      return 6;
      break;

    default:
      return 0;
  }
}

// list.map((item) {
//         return DropdownMenuItem(
//           value: item,
//           child: Container(
//             width: MediaQuery.of(context).size.width - 44,
//             child: ListTile(
//               leading: item.icon,
//               title: Text(
//                 item.name,
//                 maxLines: 3,
//                 overflow: TextOverflow.clip,
//               ),
//             ),
//           ),
//         );
//       }).toList(),
