import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextBetweenLines extends StatelessWidget {
  final String text;
  const TextBetweenLines({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 30, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 10.0,
              child: Center(
                child: Container(
                  margin: const EdgeInsetsDirectional.only(end: 10.0),
                  height: 2.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          // Text(
          //   text,
          //   style: Get.textTheme.labelSmall,
          // ),
          Expanded(
            child: SizedBox(
              height: 5.0,
              child: Center(
                child: Container(
                  margin: const EdgeInsetsDirectional.only(start: 10.0),
                  height: 2.0,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
