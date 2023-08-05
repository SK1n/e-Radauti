import 'package:flutter/material.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'package:lottie/lottie.dart';

class EmptyWidget extends StatelessWidget {
  final String text;
  const EmptyWidget({super.key, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black12, width: 0),
        borderRadius: AppConstants.borderRadius,
      ),
      child: Column(
        children: [
          SizedBox(
            width: 120,
            height: 100,
            child: Lottie.asset('assets/animations/not-found.json'),
          ),
          Container(
            padding: AppConstants.innerCardPadding,
            child: Text(
              text,
            ),
          ),
        ],
      ),
    );
  }
}
