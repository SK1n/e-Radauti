import 'package:floor/floor.dart';
import 'package:flutterapperadauti/data/models/events/events_list_model.dart';

@dao
abstract class EventsDao {
  @Query('SELECT * FROM EventsListModel')
  Future<List<EventsListModel>> getSavedEvents();

  @Query('SELECT * FROM Person WHERE id = :id')
  Future<EventsListModel?> findEventById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertEvent(EventsListModel event);

  @delete
  Future<void> deleteEvent(EventsListModel event);

  @Query("SELECT EXISTS(SELECT * FROM EventsListModel WHERE id = :id)")
  Future<bool?> eventsIsFavorite(int id);
}
