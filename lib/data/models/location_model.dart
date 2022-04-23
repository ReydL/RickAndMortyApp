import 'package:test_app/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
   const LocationModel({required String name, required String url})
      : super(name: name, url: url);

  factory LocationModel.fromJson (Map<String,dynamic> json){
    return LocationModel(
        name: json['name'],
        url: json['url']);
  }
}
