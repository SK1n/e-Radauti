import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/size/gf_size.dart';

class ErrWidget extends StatelessWidget {
  final String error;
  final Function() retry;
  const ErrWidget({super.key, required this.error, required this.retry});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(error),
        GFButton(
          onPressed: retry,
          text: 'retry',
          shape: GFButtonShape.pills,
          // color: CColors.lightBlue,
          size: GFSize.LARGE,
          blockButton: true,
          textColor: Colors.blue,
          fullWidthButton: true,
        ),
      ],
    );
  }
}
