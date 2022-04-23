import 'package:test_app/domain/entities/character_entity.dart';

abstract class CharacterRepository{
  Future<List<CharacterEntity>> getAllCharacters(int page);
  Future<List<CharacterEntity>> searchCharacter(String query);
  Future<List<CharacterEntity>> filterCharacter();
}