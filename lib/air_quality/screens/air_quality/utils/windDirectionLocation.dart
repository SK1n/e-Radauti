import 'package:flutter/material.dart';

Transform windDirectionLocation(String direction) {
  switch (direction) {
    case 'NNE':
      {
        debugPrint('wind direction nne');
        return Transform.rotate(
          angle: 0,
          child: Text(
            "Dinspre\nIaz",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      }
    case 'NE':
      {
        debugPrint('wind direction nne');
        return Transform.rotate(
          angle: 0,
          child: Text(
            "Dinspre\nVicșani",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      }
    case 'N':
      {
        debugPrint('wind direction n');
        return Transform.rotate(
          angle: 0,
          child: Text(
            "Dinspre\nMăneuți",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      }
    case 'NNV':
      {
        debugPrint('wind direction nnv');
        return Transform.rotate(
          angle: 0,
          child: Text(
            "Dinspre\nFrătăuți",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      }
    case 'NV':
      {
        debugPrint('wind direction nv');
        return Transform.rotate(
          angle: 0,
          child: Text(
            "Dinspre\nGălănești",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      }
    case 'VNV':
      {
        debugPrint('wind direction vnv');
        return Transform.rotate(
          angle: 0,
          child: Text(
            "Dinspre\nVoitinel",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      }
    case 'V':
      {
        debugPrint('wind direction v');
        return Transform.rotate(
          angle: 0,
          child: Text(
            "Dinspre\nHorodnic",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      }
    case 'VSV':
      {
        debugPrint('wind direction vsv');
        return Transform.rotate(
          angle: 0,
          child: Text(
            "Dinspre\nMarginea",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      }
    case 'SV':
      {
        debugPrint('wind direction sv');
        return Transform.rotate(
          angle: 0,
          child: Text(
            "Dinspre\nClit",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      }
    case 'SSV':
      {
        debugPrint('wind direction ssv');
        return Transform.rotate(
          angle: 0,
          child: Text(
            "Dinspre\nVolovăț",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      }
    case 'S':
      {
        debugPrint('wind direction s');
        return Transform.rotate(
          angle: 0,
          child: Text(
            "Dinspre\nBurla",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      }
    case 'SSE':
      {
        debugPrint('wind direction sse');
        return Transform.rotate(
          angle: 0,
          child: Text(
            "Dinspre\nIaslovăț",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      }
    case 'SE':
      {
        debugPrint('wind direction se');
        return Transform.rotate(
          angle: 0,
          child: Text(
            "Dinspre\nMilișăuți",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      }
    case 'ESE':
      {
        debugPrint('wind direction ese');
        return Transform.rotate(
          angle: 0,
          child: Text(
            "Dinspre\nSatu Mare",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      }
    case 'E':
      {
        debugPrint('wind direction e');
        return Transform.rotate(
          angle: 0,
          child: Text(
            "Dinspre\nCalafindești",
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        );
      }
    case 'ENE':
      debugPrint('wind direction ene');
      return Transform.rotate(
        angle: 0,
        child: Text(
          "Dinspre\nDornești",
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      );
    default:
      debugPrint('wind direction default');
      return Transform.rotate(
        angle: 0,
        child: Text(
          "Dinspre\nMăneuți",
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      );
  }
}
