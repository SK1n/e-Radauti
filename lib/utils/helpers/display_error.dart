import 'package:flutter/material.dart';
import 'package:flutter_loadingindicator/flutter_loadingindicator.dart';
import 'package:get/get.dart';

abstract class DisplayError {
  Widget displayError(Object? error) {
    EasyLoading.isShow ? EasyLoading.dismiss() : DoNothingAction();
    Get.showSnackbar(
      GetSnackBar(
        title: 'A intervenit o eroare',
        message: error.toString(),
        duration: const Duration(seconds: 5),
      ),
    );
    return Container();
  }
}
