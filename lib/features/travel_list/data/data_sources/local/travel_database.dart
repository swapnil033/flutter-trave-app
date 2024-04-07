import 'package:floor/floor.dart';
import 'package:travel_app/features/travel_list/data/models/travel.dart';

import 'dao/travel_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'travel_database.g.dart';

@Database(version: 1, entities: [TravelModel])
abstract class TravelDatabase extends FloorDatabase {
  TravelDao get travelDao;
}
