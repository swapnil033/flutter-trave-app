import 'package:floor/floor.dart';
import 'package:travel_app/features/travel_list/domain/entites/travel.dart';

@Entity(tableName: 'travel_table', primaryKeys: ['id'])
class TravelModel extends TravelEntity {
  TravelModel({
    @PrimaryKey(autoGenerate: true) required super.id,
    required super.placeName,
    required super.date,
    required super.review,
    required super.rating,
  });

  factory TravelModel.fromEntity(TravelEntity travelEntity) {
    return TravelModel(
      id: travelEntity.id,
      placeName: travelEntity.placeName,
      date: travelEntity.date,
      review: travelEntity.review,
      rating: travelEntity.rating,
    );
  }
}
