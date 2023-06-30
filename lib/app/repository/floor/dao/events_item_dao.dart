import 'package:floor/floor.dart';
import 'package:flutterapperadauti/app/models/events/events_item_model.dart';

@dao
abstract class EventsItemDao {
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
