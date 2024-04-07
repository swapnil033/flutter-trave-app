import '../entites/travel.dart';
import '../repositories/travel_repository.dart';

class DeleteTravelUseCase {
  final TravelRepository travelRepository;

  DeleteTravelUseCase(this.travelRepository);

  Future<void> call(TravelEntity entity) {
    return travelRepository.deleteTravel(entity);
  }
}
