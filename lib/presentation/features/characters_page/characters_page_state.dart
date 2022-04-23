import 'package:equatable/equatable.dart';
import 'package:test_app/domain/entities/character_entity.dart';

class CharactersPageState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CharactersPageInitialState extends CharactersPageState{}

class CharactersPageLoadingState extends CharactersPageState{

  final List<CharacterEntity> previousCharacters;

  CharactersPageLoadingState({required this.previousCharacters});

  @override
  // TODO: implement props
  List<Object?> get props => [previousCharacters];
}

class CharactersPageLoadedState extends CharactersPageState{

  final List<CharacterEntity> characters;

  CharactersPageLoadedState({required this.characters});
  @override
  // TODO: implement props
  List<Object?> get props => [characters];
}

class CharactersPageErrorState extends CharactersPageState{
  final String message;

  CharactersPageErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}