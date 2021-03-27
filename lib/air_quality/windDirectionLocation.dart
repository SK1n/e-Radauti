import 'package:flutter/material.dart';
import 'dart:math' as math;

Transform windDirectionLocation(String direction) {
  switch (direction) {
    case 'NNE':
      {
        debugPrint('wind direction nne');
        return Transform.rotate(
          angle: 0,
          child: Text("Dinspre\nIaz"),
        );
      }
    case 'NE':
      {
        debugPrint('wind direction nne');
        return Transform.rotate(
          angle: 0,
          child: Text("Dinspre\nVicșani"),
        );
      }
    case 'N':
      {
        debugPrint('wind direction n');
        return Transform.rotate(
          angle: 0,
          child: Text("Dinspre\nMăneuți"),
        );
      }
    case 'NNV':
      {
        debugPrint('wind direction nnv');
        return Transform.rotate(
          angle: 0,
          child: Text("Dinspre\nFrătăuți"),
        );
      }
    case 'NV':
      {
        debugPrint('wind direction nv');
        return Transform.rotate(
          angle: 0,
          child: Text("Dinspre\nGălănești"),
        );
      }
    case 'VNV':
      {
        debugPrint('wind direction vnv');
        return Transform.rotate(
          angle: 0,
          child: Text("Dinspre\nVoitinel"),
        );
      }
    case 'V':
      {
        debugPrint('wind direction v');
        return Transform.rotate(
          angle: 0,
          child: Text("Dinspre\nHorodnic"),
        );
      }
    case 'VSV':
      {
        debugPrint('wind direction vsv');
        return Transform.rotate(
          angle: 0,
          child: Text("Dinspre\nMarginea"),
        );
      }
    case 'SV':
      {
        debugPrint('wind direction sv');
        return Transform.rotate(
          angle: 0,
          child: Text("Dinspre\nClit"),
        );
      }
    case 'SSV':
      {
        debugPrint('wind direction ssv');
        return Transform.rotate(
          angle: 0,
          child: Text("Dinspre\nVolovăț"),
        );
      }
    case 'S':
      {
        debugPrint('wind direction s');
        return Transform.rotate(
          angle: 0,
          child: Text("Dinspre\nBurla"),
        );
      }
    case 'SSE':
      {
        debugPrint('wind direction sse');
        return Transform.rotate(
          angle: 0,
          child: Text("Dinspre\nIaslovăț"),
        );
      }
    case 'SE':
      {
        debugPrint('wind direction se');
        return Transform.rotate(
          angle: 0,
          child: Text("Dinspre\nMilișăuți"),
        );
      }
    case 'ESE':
      {
        debugPrint('wind direction ese');
        return Transform.rotate(
          angle: 0,
          child: Text("Dinspre\nSatu Mare"),
        );
      }
    case 'E':
      {
        debugPrint('wind direction e');
        return Transform.rotate(
          angle: 0,
          child: Text("Dinspre\nCalafindești"),
        );
      }
    case 'ENE':
      debugPrint('wind direction ene');
      return Transform.rotate(
        angle: 0,
        child: Text("Dinspre\nDornești"),
      );
    default:
      debugPrint('wind direction default');
      return Transform.rotate(
        angle: 0,
        child: Text("Dinspre\nMăneuți"),
      );
  }
}
