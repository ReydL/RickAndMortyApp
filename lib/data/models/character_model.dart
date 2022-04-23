import 'package:test_app/data/models/location_model.dart';
import 'package:test_app/data/models/origin_model.dart';
import 'package:test_app/domain/entities/character_entity.dart';
import 'package:test_app/domain/entities/location_entity.dart';
import 'package:test_app/domain/entities/origin_entity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel(
      {required int id,
      required String name,
      required String status,
      required String species,
      required String? type,
      required String gender,
      required origin,
      required location,
      required String image,
      required List<String> episode,
      required String url,
      required String created})
      : super(
            id: id,
            name: name,
            status: status,
            species: species,
            type: type,
            gender: gender,
            origin: origin,
            location: location,
            image: image,
            episode: episode,
            url: url,
            created: created);

  factory CharacterModel.fromJson(Map<String,dynamic> json){
      return CharacterModel(
          id: json['id'],
          name: json['name'],
          status: json['status'],
          species: json['species'],
          type: json['type'],
          gender: json['gender'],
          origin: json['origin'] != null ? OriginModel.fromJson(json['origin']) : null,
          location: json['location'] != null ? LocationModel.fromJson(json['location']) : null,
          image: json['image'],
          episode: (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
          url: json['url'],
          created: json['created']);
  }
}
