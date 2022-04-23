import 'package:test_app/domain/entities/character_entity.dart';
import 'package:test_app/domain/usecases/base_use_case.dart';
import 'package:test_app/di.dart';
import '../../repositories/character_repository.dart';

class SearchCharacter extends UseCase<List<CharacterEntity>,SearchParams>{

  final CharacterRepository characterRepository;

  SearchCharacter() : characterRepository = sl();
  @override
  Future<List<CharacterEntity>> call(SearchParams params) async{
    return await characterRepository.searchCharacter(params.query);
  }

}

class SearchParams{
  final String query;
  SearchParams({required this.query});
}