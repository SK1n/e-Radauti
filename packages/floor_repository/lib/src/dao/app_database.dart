import 'dart:async';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:floor_repository/src/dao/events_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [EventsItemModel])
abstract class AppDatabase extends FloorDatabase {
  EventsDao get eventsDao;
}
