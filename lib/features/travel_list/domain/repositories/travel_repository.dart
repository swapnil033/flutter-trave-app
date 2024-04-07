import 'package:travel_app/features/travel_list/domain/entites/travel.dart';

abstract class TravelRepository {
  Future<List<TravelEntity>> getTravelList();

  Future<void> addNewTravel(TravelEntity travelEntity);

  Future<void> deleteTravel(TravelEntity travelEntity);

  Future<void> editTravel(TravelEntity travelEntity);
}
