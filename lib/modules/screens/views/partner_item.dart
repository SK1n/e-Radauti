import 'package:flutter/material.dart';

class PartnerItem {
  Widget widgetItem(childImage, childText, childContext) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Center(
            child: Image.asset(
              childImage,
              height: 100,
              width: MediaQuery.of(childContext).size.width - 50,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            bottom: 20,
          ),
          child: Text(
            childText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
