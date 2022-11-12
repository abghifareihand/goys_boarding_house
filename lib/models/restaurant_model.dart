import 'package:goys_boarding_house/constant/config.dart';

class RestaurantModel {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,

  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
 
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
      
      };

  String getSmallPicture() => Config.imageSmall + pictureId;
  String getMediumPicture() => Config.imageMedium + pictureId;
  String getLargePicture() => Config.imageLarge + pictureId;
}
