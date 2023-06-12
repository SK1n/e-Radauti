import 'package:firestore_repository/firestore_repository.dart';
import 'package:floor/floor.dart';

@dao
abstract class EventsDao {
  @Query('SELECT * FROM EventsItemModel')
  Future<List<EventsItemModel>> getSavedEvents();

  @Query('SELECT * FROM EventsItemModel WHERE id = :id')
  Future<EventsItemModel?>? findEventById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertEvent(EventsItemModel event);

  @delete
  Future<void> deleteEvent(EventsItemModel event);

  @Query("SELECT EXISTS(SELECT * FROM EventsItemModel WHERE id = :id)")
  Future<bool?> eventsIsFavorite(int id);
}
