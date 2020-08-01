import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final int categoryId;
  final String name;
  final IconData icon;

  Category({this.categoryId, this.name, this.icon});
}

final allCategory = Category(
  categoryId: 0,
  name: "All",
  icon: Icons.search,
);

final musicCategory = Category(
  categoryId: 1,
  name: "Music",
  icon: Icons.music_note,
);

final meetUpCategory = Category(
  categoryId: 2,
  name: "Meetup",
  icon: Icons.location_on,
);

final golfCategory = Category(
  categoryId: 3,
  name: "Golf",
  icon: Icons.golf_course,
);

final birthdayCategory = Category(
  categoryId: 4,
  name: "Birthday",
  icon: Icons.cake,
);

final categories = [
  allCategory,
  musicCategory,
  meetUpCategory,
  golfCategory,
  birthdayCategory,
];

final allCategory2 = Category(
  categoryId: 0,
  name: "Toate", //"All",
  icon: Icons.search,
);

final businessCategory = Category(
  categoryId: 1,
  name: "Antreprenoriat", //"Music",
  icon: Icons.business_center, //Icons.music_note,
);

final partyCategory = Category(
  categoryId: 2,
  name: "Petrecere", //"Meetup",
  icon: Icons.local_play, //Icons.location_on,
);

final socialCategory = Category(
  categoryId: 3,
  name: "Social", //"Golf",
  icon: Icons.group_add, //Icons.golf_course,
);

final theatreCategory = Category(
  categoryId: 4,
  name: "Teatru", //"Birthday",
  icon: Icons.theaters, //Icons.cake,
);

final danceCategory = Category(
  categoryId: 5,
  name: "Dans", //"Music",
  icon: Icons.local_play, //Icons.music_note,
);

final fairCategory = Category(
  categoryId: 6,
  name: "Târg", //"Meetup",
  icon: Icons.location_on,
);

final administrationCategory = Category(
  categoryId: 7,
  name: "Administrație locală", //"Golf",
  icon: Icons.location_city, //Icons.golf_course,
);

final musicCategory2 = Category(
  categoryId: 8,
  name: "Muzică", //"Birthday",
  icon: Icons.music_note, //Icons.cake,
);

final categories2 = [
  allCategory2, //allCategory,
  businessCategory, //musicCategory,
  partyCategory, //meetUpCategory,
  socialCategory, //golfCategory,
  theatreCategory, //birthdayCategory,
  danceCategory, //musicCategory,
  fairCategory, //meetUpCategory,
  administrationCategory, //golfCategory,
  musicCategory2, //birthdayCategory,
];