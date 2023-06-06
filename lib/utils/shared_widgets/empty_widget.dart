import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyWidget extends StatelessWidget {
  final String text;
  const EmptyWidget({super.key, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: Lottie.asset('assets/animations/not-found.json'),
        ),
        Text(text),
      ],
    );
  }
}
