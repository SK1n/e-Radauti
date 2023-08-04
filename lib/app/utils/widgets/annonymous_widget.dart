import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/repository/authentication/authentication_repository.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'package:flutterapperadauti/gen/strings.g.dart';

class AnnonymousWidget extends StatelessWidget {
  const AnnonymousWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: AppConstants.innerCardPadding,
        child: Column(
          children: [
            Container(
              padding: AppConstants.innerCardPadding,
              child: Text(
                t.guestScreen.description,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: AppConstants.topDelimiter,
              child: FilledButton(
                onPressed: () {
                  context.read<AuthenticationRepository>().logOut();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Padding(
                  padding: AppConstants.innerCardPadding,
                  child: Text(
                    t.guestScreen.buttonText.toUpperCase(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
