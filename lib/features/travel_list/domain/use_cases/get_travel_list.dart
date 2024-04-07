import 'package:travel_app/features/travel_list/domain/entites/travel.dart';
import 'package:travel_app/features/travel_list/domain/repositories/travel_repository.dart';

class GetTravelListUseCase {
  final TravelRepository travelRepository;

  GetTravelListUseCase(this.travelRepository);

  Future<List<TravelEntity>> call() {
    return travelRepository.getTravelList();
  }
}
