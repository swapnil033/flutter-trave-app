import 'package:travel_app/features/travel_list/domain/entites/travel.dart';

import '../repositories/travel_repository.dart';

class AddTravelUseCase {
  final TravelRepository travelRepository;

  AddTravelUseCase(this.travelRepository);

  Future<void> call(TravelEntity entity) {
    return travelRepository.addNewTravel(entity);
  }
}
