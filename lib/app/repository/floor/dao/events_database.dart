import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:flutterapperadauti/app/repository/floor/dao/events_item_dao.dart';

part 'events_database.g.dart';

@Database(version: 1, entities: [])
abstract class EventsDatabase extends FloorDatabase {
  EventsItemDao get eventsItemDao;
}
