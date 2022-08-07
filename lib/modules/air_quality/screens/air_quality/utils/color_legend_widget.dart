import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class ColorLegendWidget extends StatelessWidget {
  const ColorLegendWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 40,
              child: TextButton(
                child: Icon(
                  FontAwesome5.square,
                  color: Color.fromRGBO(80, 240, 230, 1),
                  //You also have to change the color in value_adapter.dart
                  //in case you change the colors
                ),
                onPressed: null,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Text(
                'Nivelul de PM2,5 este bun (0 - 10 \u03BCg/m\u00B3)',
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
              width: 40,
              child: TextButton(
                child: Icon(
                  FontAwesome5.square,
                  color: Color.fromRGBO(80, 204, 170, 1),
                  //You also have to change the color in value_adapter.dart
                  //in case you change the colors
                ),
                onPressed: null,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Text(
                'Nivelul de PM2,5 este acceptabil (10 - 20 \u03BCg/m\u00B3)',
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
              width: 40,
              child: TextButton(
                child: Icon(
                  FontAwesome5.square,
                  color: Color.fromRGBO(240, 230, 65, 1),
                  //You also have to change the color in value_adapter.dart
                  //in case you change the colors
                ),
                onPressed: null,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Text(
                'Nivelul de PM2,5 este moderat (20 - 25 \u03BCg/m\u00B3)',
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
              width: 40,
              child: TextButton(
                onPressed: null,
                child: Icon(
                  FontAwesome5.square,
                  color: Color.fromRGBO(255, 80, 80, 1),
                  //You also have to change the color in value_adapter.dart
                  //in case you change the colors
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Text(
                'Nivelul de PM2,5 este rău (25 - 50 \u03BCg/m\u00B3)',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 40,
              child: TextButton(
                onPressed: null,
                child: Icon(
                  FontAwesome5.square,
                  color: Color.fromRGBO(150, 0, 50, 1),
                  //You also have to change the color in value_adapter.dart
                  //in case you change the colors
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Text(
                'Nivelul de PM2,5 este foarte rău (50 - 75 \u03BCg/m\u00B3)',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 40,
              child: TextButton(
                onPressed: null,
                child: Icon(
                  FontAwesome5.square,
                  color: Color.fromRGBO(125, 33, 129, 1),
                  //You also have to change the color in value_adapter.dart
                  //in case you change the colors
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Text(
                'Nivelul de PM2,5 este extrem de rău (75 - 800 \u03BCg/m\u00B3)',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
