import 'package:test_app/domain/entities/character_entity.dart';
import 'package:test_app/domain/usecases/base_use_case.dart';
import 'package:test_app/di.dart';
import '../../repositories/character_repository.dart';

class FilterCharacter extends UseCase<List<CharacterEntity>, CharacterFilterParams>{

  final CharacterRepository characterRepository;

  FilterCharacter() : characterRepository = sl();
  @override
  Future<List<CharacterEntity>> call(CharacterFilterParams params) async{
    return await characterRepository.filterCharacter(params.gender, params.status);
  }

}

class CharacterFilterParams{
  final String gender;
  final String status;

  CharacterFilterParams({required this.gender,required this.status});
}