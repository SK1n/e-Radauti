import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';
import 'package:flutterapperadauti/dao/events_dao.dart';
import 'package:flutterapperadauti/data/models/events/events_item_model.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [EventsItemModel])
abstract class AppDatabase extends FloorDatabase {
  EventsDao get eventsDao;
}
