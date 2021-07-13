import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/notice_a_problem/create_message.dart';

class SendButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  const SendButton({Key key, this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
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
