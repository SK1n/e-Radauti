import 'package:flutter/material.dart';
import 'package:flutterapperadauti/events/app_state.dart'; //import 'package:flutterapp/app_state.dart';
import 'package:provider/provider.dart';
import '../../model/category.dart';
import 'package:flutterapperadauti/events/styleguide.dart'; //import 'package:flutterapp/styleguide.dart';

//import 'package:flutterapperadauti/TownHall/town_hall_main.dart';

class CategoryWidget extends StatelessWidget {

  final Category category;

  const CategoryWidget({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.categoryId;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          appState.updateCategoryId(category.categoryId);
        }
      },
      child:Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          //border: Border.all(color: isSelected ? Colors.white : Color(0x99FFFFFF), width: 3),
          border: Border.all(color: isSelected ? Color(0xAA38A49C) : Color(0x4438A49C), width: 3), //Color(0xAAFB6340) Color(0x44FB6340) //Colors.white Color(0x99FFFFFF)
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: isSelected ? Color(0xAA38A49C) : Colors.transparent, //Color(0xAAFB6340) // Colors.white : Colors.transparent, //Color(0x44FB6340)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              category.icon,
              //color: Theme.of(context).primaryColor,
              color: isSelected ? Theme.of(context).primaryColor : Color(0xAA38A49C), //Color(0xAAFB6340), //Colors.white
              size: 40,
            ),
            SizedBox(height: 10,),
            Text(
              category.name,
              style: isSelected ? selectedCategoryTextStyle : categoryTextStyle, //selectedCategoryTextStyle : categoryTextStyle,
            )
          ],
        ),
      ),
    );
  }
}