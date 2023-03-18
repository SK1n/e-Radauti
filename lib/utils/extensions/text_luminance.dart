import 'package:flutter/material.dart';

extension TextLuminance on Text {
  Text luminance(Color color) {
    return Text(
      data!,
      style: TextStyle(
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black),
    );
  }
}
