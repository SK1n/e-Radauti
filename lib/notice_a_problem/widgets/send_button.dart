import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/notice_a_problem/create_message.dart';

class SendButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final bool disabled;
  const SendButton({Key key, this.formKey, this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return disabled
        ? FlatButton(
            onPressed: null,
            color: Colors.redAccent,
            textColor: Colors.white,
            child: Platform.isAndroid
                ? CircularProgressIndicator()
                : CupertinoActivityIndicator(),
          )
        : FlatButton(
            color: Colors.redAccent,
            textColor: Colors.white,
            child: Text('Trimite'),
            onPressed: () async {
              {
                if (formKey.currentState.validate()) {
                  await createMessage(context, formKey);
                }
              }
            },
          );
  }
}
