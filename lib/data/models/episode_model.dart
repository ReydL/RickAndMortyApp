import 'package:test_app/domain/entities/episode_entity.dart';

class EpisodeModel extends EpisodeEntity {
  const EpisodeModel(
      {required int id,
      required String name,
      required String airDate,
      required String episode,
      required List<String> characters,
      required String url,
      required String created})
      : super(
            id: id,
            name: name,
            airDate: airDate,
            episode: episode,
            characters: characters,
            url: url,
            created: created);

  factory EpisodeModel.fromJson(Map<String, dynamic> json){
   return EpisodeModel(
       id: json['id'],
       name: json['name'],
       airDate: json['air_date'],
       episode: json['episode'],
       characters: (json['characters'] as List<dynamic>).map((e) => e as String).toList(),
       url: json['url'],
       created: json['created']);
  }
}


