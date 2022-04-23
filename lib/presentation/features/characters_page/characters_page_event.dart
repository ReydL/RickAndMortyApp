import 'package:equatable/equatable.dart';
import 'package:test_app/domain/entities/character_entity.dart';

class CharactersPageEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CharactersPageFetchEvent extends CharactersPageEvent{}

class CharactersPageSearchEvent extends CharactersPageEvent{
  final String query;

  CharactersPageSearchEvent({required this.query});

  @override
  // TODO: implement props
  List<Object?> get props => [query];

}

class CharacterPageFilterEvent extends CharactersPageEvent{
  final String gender;
  final String status;

  CharacterPageFilterEvent({required this.gender,required this.status});
  @override
  // TODO: implement props
  List<Object?> get props => [gender,status];
}