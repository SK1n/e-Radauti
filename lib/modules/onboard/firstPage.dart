import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

PageViewModel firstPage() {
  return PageViewModel(
    pageColor: Colors.white,
    mainImage: Column(
      children: [
        Image.asset(
          'assets/logo_images/app_logo_final.png',
          width: Get.width / 3,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            'Aplicația e-Rădăuți',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, left: 40, right: 40),
          child: Text(
            'Aplicație dezvoltată voluntar de către\nAsociația Radauțiul Civic',
            style: TextStyle(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
          child: Text(
            'Bine ai venit!',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
    textStyle: TextStyle(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black),
  );
}
