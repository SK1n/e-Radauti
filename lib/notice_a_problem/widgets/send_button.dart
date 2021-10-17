import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/notice_a_problem/create_message.dart';
import 'package:flutterapperadauti/state/loading_state.dart';
import 'package:provider/provider.dart';

class SendButton extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final bool disabled;
  const SendButton({Key key, this.formKey, this.disabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<SendButtonLoadingState>().isLoading
        ? TextButton(
            onPressed: () => DoNothingAction(),
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              primary: Colors.white,
            ),
            child: Platform.isAndroid
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : CupertinoActivityIndicator(),
          )
        : TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              primary: Colors.white,
            ),
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

class SendButtonLoadingState extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void updateState(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
