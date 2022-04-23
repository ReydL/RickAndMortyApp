import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/entities/character_entity.dart';
import 'package:test_app/domain/usecases/characters/get_all_characters.dart';
import 'package:test_app/domain/usecases/characters/search_character.dart';
import 'package:test_app/presentation/features/characters_page/characters_page_event.dart';
import 'package:test_app/presentation/features/characters_page/characters_page_state.dart';
import 'package:test_app/di.dart';

class CharactersPageBloc extends Bloc<CharactersPageEvent,CharactersPageState>{

  final GetAllCharacters getAllCharacters;
  final SearchCharacter searchCharacter;
  List<CharacterEntity> characters = [];
  int page = 1;
  CharactersPageBloc() :
        getAllCharacters = sl(),
        searchCharacter = sl(),
        super(CharactersPageInitialState()){
    on<CharactersPageFetchEvent>((event, emit) async{
      emit(CharactersPageLoadingState());
      try{
        characters = await getAllCharacters(CharacterParams(page: page));
        emit(CharactersPageLoadedState(characters: characters));
        page++;
      } catch(_){
        emit (CharactersPageErrorState(message: 'No more characters'));
      }
    });

    on<CharactersPageSearchEvent>((event, emit) async {
      emit(CharactersPageInitialState());
      emit(CharactersPageLoadingState());
      try{
        print('bloc');
        characters = await searchCharacter(SearchParams(query: event.query));
        print(characters);
        emit(CharactersPageLoadedState(characters: characters));
      } catch(_){
        emit (CharactersPageErrorState(message: 'There is no character with this name'));
      }
    });
  }

}