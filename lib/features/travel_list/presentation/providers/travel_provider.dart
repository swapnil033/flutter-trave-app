import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../injection_container.dart';
import '../../domain/entites/travel.dart';
import '../../domain/use_cases/add_travel.dart';
import '../../domain/use_cases/delete_tavel.dart';
import '../../domain/use_cases/edit_travel.dart';
import '../../domain/use_cases/get_travel_list.dart';

class TravelNotifier extends StateNotifier<List<TravelEntity>> {
  final GetTravelListUseCase getTravelListUseCase;
  final AddTravelUseCase addTravelUseCase;
  final DeleteTravelUseCase deleteTravelUseCase;
  final EditTravelUseCase editTravelUseCase;

  TravelNotifier(
    this.getTravelListUseCase,
    this.addTravelUseCase,
    this.deleteTravelUseCase,
    this.editTravelUseCase,
  ) : super([]) {
    getList();
  }

  void getList() async {
    var list = await getTravelListUseCase();
    state = list;
  }

  void addTravel(TravelEntity entity) async {
    await addTravelUseCase(entity);
    getList();
  }

  void editTravel(TravelEntity entity) async {
    await editTravelUseCase(entity);
    getList();
  }

  void deleteTravel(TravelEntity entity) async {
    await deleteTravelUseCase(entity);
    getList();
  }
}

final travelProvider =
    StateNotifierProvider<TravelNotifier, List<TravelEntity>>((ref) {
  return TravelNotifier(sl(), sl(), sl(), sl());
});
