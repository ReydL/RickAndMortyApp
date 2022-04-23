import 'dart:convert';

import 'package:test_app/data/exceptions/exceptions.dart';
import 'package:test_app/data/models/character_model.dart';
import 'package:http/http.dart' as http;

abstract class CharacterDataSource{
  Future<List<CharacterModel>> getAllCharacters(int page);
  Future<List<CharacterModel>> searchCharacter(String query);
  Future<List<CharacterModel>> filterCharacters(String gender, String status);
}

class CharacterDataSourceImpl implements CharacterDataSource{
  
  final http.Client client;

  CharacterDataSourceImpl({required this.client});
  @override
  Future<List<CharacterModel>> getAllCharacters(int page) async{
    try{
      final response = await client.get(Uri.parse('https://rickandmortyapi.com/api/character/?page=$page'), headers: {'Content-Type' : 'application/json'});
      final characters = json.decode(response.body);
      return (characters['results'] as List).map((episode) => CharacterModel.fromJson(episode)).toList();
    } catch (_){
      throw ServerException();
    }


  }

  @override
  Future<List<CharacterModel>> searchCharacter(String query) async{
    try{
      final response = await client.get(Uri.parse('https://rickandmortyapi.com/api/character/?name=$query'), headers: {'Content-Type' : 'application/json'});
      final characters = json.decode(response.body);
      print('request');
      return (characters['results'] as List).map((episode) => CharacterModel.fromJson(episode)).toList();
    } catch(_){
      throw ServerException();
    }
  }

  @override
  Future<List<CharacterModel>> filterCharacters(String gender, String status) async{
    try{
      final response = await client.get(Uri.parse('https://rickandmortyapi.com/api/character/?gender=$gender' + '&status=$status'));
      final characters = json.decode(response.body);
      return (characters['results'] as List).map((episode) => CharacterModel.fromJson(episode)).toList();
    } catch(_){
      throw ServerException();
    }
  }
  
}