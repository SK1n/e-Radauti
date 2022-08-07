import 'package:flutter/material.dart';
import 'dart:math' as math;

Transform windDirection(String direction) {
  switch (direction) {
    case 'NNE':
      {
        debugPrint('wind direction nne');
        return Transform.rotate(
          angle: 23 * math.pi / 180,
          child: Icon(
            Icons.arrow_circle_down_outlined,
            color: Colors.black,
          ),
        );
      }
    case 'N':
      {
        debugPrint('wind direction n');
        return Transform.rotate(
          angle: 0 * math.pi / 180,
          child: Icon(
            Icons.arrow_circle_down_outlined,
            color: Colors.black,
          ),
        );
      }
    case 'NNV':
      {
        debugPrint('wind direction nnv');
        return Transform.rotate(
          angle: 292 * math.pi / 180,
          child: Icon(
            Icons.arrow_circle_down_outlined,
            color: Colors.black,
          ),
        );
      }
    case 'NV':
      {
        debugPrint('wind direction nv');
        return Transform.rotate(
          angle: 315 * math.pi / 180,
          child: Icon(
            Icons.arrow_circle_down_outlined,
            color: Colors.black,
          ),
        );
      }
    case 'VNV':
      {
        debugPrint('wind direction vnv');
        return Transform.rotate(
          angle: 293 * math.pi / 180,
          child: Icon(
            Icons.arrow_circle_down_outlined,
            color: Colors.black,
          ),
        );
      }
    case 'V':
      {
        debugPrint('wind direction v');
        return Transform.rotate(
          angle: 270 * math.pi / 180,
          child: Icon(
            Icons.arrow_circle_down_outlined,
            color: Colors.black,
          ),
        );
      }
    case 'VSV':
      {
        debugPrint('wind direction vsv');
        return Transform.rotate(
          angle: 248 * math.pi / 180,
          child: Icon(
            Icons.arrow_circle_down_outlined,
            color: Colors.black,
          ),
        );
      }
    case 'SV':
      {
        debugPrint('wind direction sv');
        return Transform.rotate(
          angle: 225 * math.pi / 180,
          child: Icon(
            Icons.arrow_circle_down_outlined,
            color: Colors.black,
          ),
        );
      }
    case 'SSV':
      {
        debugPrint('wind direction ssv');
        return Transform.rotate(
          angle: 203 * math.pi / 180,
          child: Icon(
            Icons.arrow_circle_down_outlined,
            color: Colors.black,
          ),
        );
      }
    case 'S':
      {
        debugPrint('wind direction s');
        return Transform.rotate(
          angle: 180 * math.pi / 180,
          child: Icon(
            Icons.arrow_circle_down_outlined,
            color: Colors.black,
          ),
        );
      }
    case 'SSE':
      {
        debugPrint('wind direction sse');
        return Transform.rotate(
          angle: 158 * math.pi / 180,
          child: Icon(
            Icons.arrow_circle_down_outlined,
            color: Colors.black,
          ),
        );
      }
    case 'ESE':
      {
        debugPrint('wind direction ese');
        return Transform.rotate(
          angle: 113 * math.pi / 180,
          child: Icon(
            Icons.arrow_circle_down_outlined,
            color: Colors.black,
          ),
        );
      }
    case 'E':
      {
        debugPrint('wind direction e');
        return Transform.rotate(
          angle: 90 * math.pi / 180,
          child: Icon(
            Icons.arrow_circle_down_outlined,
            color: Colors.black,
          ),
        );
      }
    case 'ENE':
      debugPrint('wind direction ene');
      return Transform.rotate(
        angle: 68 * math.pi / 180,
        child: Icon(
          Icons.arrow_circle_down_outlined,
          color: Colors.black,
        ),
      );
    case 'NE':
      debugPrint('wind direction ne');
      return Transform.rotate(
        angle: 45 * math.pi / 180,
        child: Icon(
          Icons.arrow_circle_down_outlined,
          color: Colors.black,
        ),
      );
    default:
      debugPrint('wind direction default');
      return Transform.rotate(
        angle: 0 * math.pi / 180,
        child: Icon(
          Icons.arrow_circle_down_outlined,
          color: Colors.black,
        ),
      );
  }
}
