import 'package:travel_app/features/travel_list/domain/repositories/travel_repository.dart';

import '../entites/travel.dart';

class EditTravelUseCase {
  final TravelRepository travelRepository;

  EditTravelUseCase(this.travelRepository);

  Future<void> call(TravelEntity entity) {
    return travelRepository.addNewTravel(entity);
  }
}
