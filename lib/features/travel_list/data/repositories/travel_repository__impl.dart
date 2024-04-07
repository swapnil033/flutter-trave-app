import 'package:travel_app/features/travel_list/data/data_sources/local/dao/travel_dao.dart';
import 'package:travel_app/features/travel_list/data/models/travel.dart';
import 'package:travel_app/features/travel_list/domain/entites/travel.dart';
import 'package:travel_app/features/travel_list/domain/repositories/travel_repository.dart';

class TravelRepositoryImpl implements TravelRepository {
  final TravelDao travelDao;

  TravelRepositoryImpl(this.travelDao);

  @override
  Future<void> addNewTravel(TravelEntity travelEntity) {
    return travelDao.addTravel(TravelModel.fromEntity(travelEntity));
  }

  @override
  Future<void> deleteTravel(TravelEntity travelEntity) {
    return travelDao.deleteTravel(TravelModel.fromEntity(travelEntity));
  }

  @override
  Future<void> editTravel(TravelEntity travelEntity) {
    return travelDao.addTravel(TravelModel.fromEntity(travelEntity));
  }

  @override
  Future<List<TravelModel>> getTravelList() {
    return travelDao.getTravelList();
  }
}
