// import 'package:expandable/expandable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// class MapLegend extends StatelessWidget {
//   const MapLegend({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SpeedDialChild();
//   }
// }

// Icon switchIcon(int icon) {
//   switch (icon) {
//     case 0:
//       return Icon(MaterialCommunityIcons.dots_horizontal_circle_outline);
//       break;
//     case 1:
//       return Icon(MaterialCommunityIcons.trash_can_outline);
//       break;
//     case 2:
//       return Icon(MaterialCommunityIcons.road);
//       break;
//     case 3:
//       return Icon(MaterialCommunityIcons.electric_switch);
//       break;
//     case 4:
//       return Icon(MaterialCommunityIcons.home_alert);
//       break;
//     case 5:
//       return Icon(MaterialCommunityIcons.security);
//       break;
//     case 7:
//       return Icon(MaterialCommunityIcons.blur);
//       break;
//     default:
//       return Icon(MaterialCommunityIcons.dots_horizontal_circle_outline);
//   }
// }

// String switchTitle(int icon) {
//   switch (icon) {
//     case 0:
//       return 'Masina abandonata';
//       break;
//     case 1:
//       return 'Gunoi neridicat';
//       break;
//     case 2:
//       return 'assets/images/mapIcons/pitfall.png';
//       break;
//     case 3:
//       return 'assets/images/mapIcons/iluminat_public.png';
//       break;
//     case 4:
//       return 'assets/images/mapIcons/probleme_utilitati.png';
//       break;
//     case 5:
//       return 'assets/images/mapIcons/illegal_constructions.png';
//       break;
//     case 6:
//       return 'assets/images/mapIcons/deranj_ordinea_publica.png';
//       break;
//     case 7:
//       return 'assets/images/mapIcons/sanatate.png';
//       break;
//     case 8:
//       return 'assets/images/mapIcons/siguranta.png';
//       break;
//     case 9:
//       return 'assets/images/mapIcons/lipsa_loc_handicap.png';
//     case 10:
//       return 'assets/images/mapIcons/poluare.png';
//       break;
//     case 11:
//       return 'assets/images/mapIcons/lipsa_semn_circulatie.png';
//       break;
//     default:
//       return 'assets/images/mapIcons/default_marker.png';
//   }
// }

// class ListTileLegendMap extends StatelessWidget {
//   final String title;
//   final String content;
//   final int index;
//   const ListTileLegendMap({Key key, this.content, this.index, this.title})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         visualDensity: VisualDensity.compact,
//         leading: Image.asset(
//           switchIcon(index),
//         ),
//         title: Text(
//           switchTitle(index),
//           maxLines: 5,
//           overflow: TextOverflow.ellipsis,
//         ),
//         subtitle: content != null ? Text('$content', maxLines: 2) : Text(''));
//   }
// }
