import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpTextWidget extends StatelessWidget {
  final String text;
  const SignUpTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
          Text(
            text,
            style: Get.textTheme.labelSmall,
          ),
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
