import 'package:test_app/domain/entities/character_entity.dart';
import 'package:test_app/domain/repositories/character_repository.dart';
import 'package:test_app/domain/usecases/base_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/di.dart';

class GetAllCharacters extends UseCase<List<CharacterEntity>, CharacterParams>{

  final CharacterRepository characterRepository;

  GetAllCharacters() : characterRepository = sl();

  @override
  Future<List<CharacterEntity>> call(CharacterParams params) async{
    return await characterRepository.getAllCharacters(params.page);
  }

}

class CharacterParams extends Equatable{
  final int page;

  const CharacterParams({required this.page});

  @override
  List<Object?> get props => [page];

}