import 'package:flutter/material.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'package:flutterapperadauti/gen/strings.g.dart';

class ErrWidget extends StatelessWidget {
  final String error;
  final Function() retry;
  const ErrWidget({super.key, required this.error, required this.retry});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: AppConstants.innerCardPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: AppConstants.innerCardPadding,
              child: Text(error),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: FilledButton(
                onPressed: retry,
                child: Text(
                  context.t.buttons.retry,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
