import 'dart:convert';

import 'package:test_app/data/exceptions/exceptions.dart';
import 'package:test_app/data/models/episode_model.dart';
import 'package:http/http.dart' as http;

abstract class EpisodeDataSource{
  Future<List<EpisodeModel>> getAllEpisodes(int page);
}


class EpisodeDataSourceImpl implements EpisodeDataSource{
  final http.Client client;

  EpisodeDataSourceImpl({required this.client});
  @override
  Future<List<EpisodeModel>> getAllEpisodes(int page) async{
    try{
      final response = await client.get(Uri.parse('https://rickandmortyapi.com/api/episode?page=$page'), headers: {'Content-Type' : 'application/json'});
      final episodes = json.decode(response.body);
      return (episodes['results'] as List).map((episode) => EpisodeModel.fromJson(episode)).toList();
    } catch(_){
      throw ServerException();
    }
  }

}