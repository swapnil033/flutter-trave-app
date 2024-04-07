class TravelEntity {
  final int? id;
  final String placeName;
  final String date;
  final String review;
  final int rating;

  TravelEntity({
    this.id,
    required this.placeName,
    required this.date,
    required this.review,
    required this.rating,
  });
}
