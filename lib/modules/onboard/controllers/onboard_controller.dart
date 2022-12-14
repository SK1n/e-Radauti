import 'package:flutter/material.dart';
import 'package:flutterapperadauti/modules/onboard/views/oboard_slides.dart';
import 'package:get/get.dart';

class OnboardController extends GetxController {
  final _page = 0.obs;
  get page => _page.value;
  set page(value) => _page.value = value;

  List<OnboardSlides> list = [];

  final PageController pageController = PageController();
}
