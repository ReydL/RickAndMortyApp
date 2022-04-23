import 'package:test_app/data/data_source/characters/character_data_source.dart';
import 'package:test_app/domain/entities/character_entity.dart';
import 'package:test_app/domain/repositories/character_repository.dart';
import 'package:test_app/di.dart';

class CharacterRepositoryImpl implements CharacterRepository{

  final CharacterDataSource characterDataSource;

  CharacterRepositoryImpl() : characterDataSource = sl();
  @override
  Future<List<CharacterEntity>> filterCharacter() {
    // TODO: implement filterCharacter
    throw UnimplementedError();
  }

  @override
  Future<List<CharacterEntity>> getAllCharacters(int page) async{
    return await characterDataSource.getAllCharacters(page);
  }

  @override
  Future<List<CharacterEntity>> searchCharacter(String query) async{
    return await characterDataSource.searchCharacter(query);
  }
  
}