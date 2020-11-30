import 'package:flutter/cupertino.dart';

var identifyDestiantion = IdentifyDestination();

class IdentifyDestination {
  String identify(value) {
    switch (value) {
      case "Destinatar":
        {
          debugPrint('identify_destination: No value selected!');
          return null;
        }
        break;
      case "Primăria Rădăuți":
        {
          debugPrint('identify_destination: relatiipublice@primariaradauti.ro');
          return "relatiipublice@primariaradauti.ro";
        }
        break;
      case "Servicii Comunale":
        {
          debugPrint('identify_destination: office@serviciicomunale.ro');
          return "office@serviciicomunale.ro";
        }
        break;
      case "ACET Rădăuți":
        {
          debugPrint('identify_destination: agentia.radauti@acetsv.ro');
          return "agentia.radauti@acetsv.ro";
        }
        break;
      case "Consiliul Județean Suceava":
        {
          debugPrint('identify_destination: contact@cjsuceava.ro');
          return "contact@cjsuceava.ro";
        }
        break;
      case "Garda De Mediu Suceava":
        {
          debugPrint('identify_destination: cjsuceava@gnm.ro');
          return "cjsuceava@gnm.ro";
        }
        break;
      case "Garda Forestieră Suceava":
        {
          debugPrint('identify_destination: gardaforestiera.suceava@gmail.com');
          return "gardaforestiera.suceava@gmail.com";
        }
        break;
      case "Rădăuțiul Civic":
        {
          debugPrint('identify_destination: radautiulcivic@gmail.com');
          return "luys2007@outlook.com";
        }
        break;
      default:
        {
          debugPrint('identify_destination: No value selected!');
          return null;
        }
    }
  }
}
