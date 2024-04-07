import 'package:floor/floor.dart';
import 'package:travel_app/features/travel_list/data/models/travel.dart';

@dao
abstract class TravelDao {
  @Query('SELECT * FROM travel_table')
  Future<List<TravelModel>> getTravelList();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addTravel(TravelModel travelModel);

  @delete
  Future<void> deleteTravel(TravelModel travelModel);
}
