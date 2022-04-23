import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/entities/character_entity.dart';
import 'package:test_app/domain/usecases/characters/filter_character.dart';
import 'package:test_app/domain/usecases/characters/get_all_characters.dart';
import 'package:test_app/domain/usecases/characters/search_character.dart';
import 'package:test_app/presentation/features/characters_page/characters_page_event.dart';
import 'package:test_app/presentation/features/characters_page/characters_page_state.dart';
import 'package:test_app/di.dart';

class CharactersPageBloc extends Bloc<CharactersPageEvent,CharactersPageState>{

  final GetAllCharacters getAllCharacters;
  final SearchCharacter searchCharacter;
  final FilterCharacter filterCharacter;
  List<CharacterEntity> previousCharacters = [];
  int page = 1;
  CharactersPageBloc() :
        filterCharacter = sl(),
        getAllCharacters = sl(),
        searchCharacter = sl(),
        super(CharactersPageInitialState()){

    on<CharactersPageFetchEvent>((event, emit) async{
      final currentState = state;
      if(currentState is CharactersPageLoadingState){
        previousCharacters = currentState.previousCharacters;
      }
      emit(CharactersPageLoadingState(previousCharacters: previousCharacters));
      try{
        final newCharacters = await getAllCharacters(CharacterParams(page: page));
        final characters = (state as CharactersPageLoadingState).previousCharacters;
        characters.addAll(newCharacters);
        emit(CharactersPageLoadedState(characters: characters));
        page++;
      } catch(_){
        emit (CharactersPageErrorState(message: 'No more characters'));
      }
    });

    on<CharactersPageSearchEvent>((event, emit) async {

      try{

       final characters = await searchCharacter(SearchParams(query: event.query));

        emit(CharactersPageLoadedState(characters: characters));
      } catch(_){
        emit (CharactersPageErrorState(message: 'There is no character with this name'));
      }
    });

    on<CharacterPageFilterEvent>((event, emit) async{
   emit(CharactersPageLoadingState(previousCharacters: previousCharacters));
    try{
      print('bloc');
      final characters = await filterCharacter(CharacterFilterParams(gender: event.gender, status: event.status));
      emit(CharactersPageLoadedState(characters: characters));
    } catch (_){
      emit (CharactersPageErrorState(message: 'There is no character with this filters'));
    }
    });
  }

}