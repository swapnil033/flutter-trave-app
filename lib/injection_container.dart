import 'package:get_it/get_it.dart';

import 'features/travel_list/data/data_sources/local/dao/travel_dao.dart';
import 'features/travel_list/data/data_sources/local/travel_database.dart';
import 'features/travel_list/data/repositories/travel_repository__impl.dart';
import 'features/travel_list/domain/repositories/travel_repository.dart';
import 'features/travel_list/domain/use_cases/add_travel.dart';
import 'features/travel_list/domain/use_cases/delete_tavel.dart';
import 'features/travel_list/domain/use_cases/edit_travel.dart';
import 'features/travel_list/domain/use_cases/get_travel_list.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorTravelDatabase.databaseBuilder('travel_database.db').build();

  sl.registerSingleton<TravelDao>(database.travelDao);

  sl.registerSingleton<TravelRepository>(TravelRepositoryImpl(sl()));

  sl.registerSingleton<GetTravelListUseCase>(GetTravelListUseCase(sl()));

  sl.registerSingleton<AddTravelUseCase>(AddTravelUseCase(sl()));

  sl.registerSingleton<DeleteTravelUseCase>(DeleteTravelUseCase(sl()));

  sl.registerSingleton<EditTravelUseCase>(EditTravelUseCase(sl()));
}
