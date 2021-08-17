import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutterapperadauti/state/notice_problem_notifier.dart';
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
    List list = [
      Item('Altele',
          Icon(MaterialCommunityIcons.dots_horizontal_circle_outline), 0),
      Item(
          'Gunoi neridicat', Icon(MaterialCommunityIcons.trash_can_outline), 1),
      Item('Infrastructură', Icon(MaterialCommunityIcons.road), 2),
      Item('Probleme la utilitati',
          Icon(MaterialCommunityIcons.electric_switch), 3),
      Item('Constructii ilegale', Icon(MaterialCommunityIcons.home_alert), 4),
      Item('Siguranta', Icon(MaterialCommunityIcons.security), 5),
      Item(
          'Calitatea aerului si poluare', Icon(MaterialCommunityIcons.blur), 6),
    ];
    return DropdownButton(
      itemHeight: 80,
      value: list[noticeFormState.typeIndex],
      items: list.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Container(
            width: MediaQuery.of(context).size.width - 44,
            child: ListTile(
              leading: item.icon,
              title: Text(
                item.name,
                maxLines: 3,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: (value) {
        noticeFormState.upTypeName(value.name);
        debugPrint('${noticeFormState.typeNmae}');
        noticeFormState.upType(value.index);
      },
    );
  }
}
