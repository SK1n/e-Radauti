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
      Item('Masini Abandonate', Icon(MaterialCommunityIcons.car), 1),
      Item(
          'Gunoi neridicat', Icon(MaterialCommunityIcons.trash_can_outline), 2),
      Item('Obstacole pe drum sau trotuar', Icon(MaterialCommunityIcons.road),
          3),
      Item('Iluminat Public', Icon(MaterialCommunityIcons.lightbulb), 4),
      Item('Probleme la utilitati',
          Icon(MaterialCommunityIcons.electric_switch), 5),
      Item('Constructii ilegale', Icon(MaterialCommunityIcons.home_alert), 6),
      Item('Deranjarea ordinii publice',
          Icon(MaterialCommunityIcons.emoticon_angry_outline), 7),
      Item('Sanatate', Icon(MaterialCommunityIcons.pharmacy), 8),
      Item('Siguranta', Icon(MaterialCommunityIcons.security), 9),
      Item('Lipsa facilitati persoane cu dizabilitati',
          Icon(MaterialCommunityIcons.wheelchair_accessibility), 10),
      Item('Calitatea aerului si poluare', Icon(MaterialCommunityIcons.blur),
          11),
      Item('Lipsa semn de circulatie',
          Icon(MaterialCommunityIcons.traffic_light), 12),
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
        noticeFormState.upType(value.index);
      },
    );
  }
}
