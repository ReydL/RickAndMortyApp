import 'package:get_it/get_it.dart';
import 'package:test_app/data/data_source/characters/character_data_source.dart';
import 'package:test_app/data/data_source/episodes/episode_data_source.dart';
import 'package:test_app/data/repositories/character_repository_impl.dart';
import 'package:test_app/data/repositories/episode_repository_impl.dart';
import 'package:test_app/domain/repositories/character_repository.dart';
import 'package:test_app/domain/repositories/episode_repository.dart';

import 'package:http/http.dart' as http;
import 'package:test_app/domain/usecases/characters/get_all_characters.dart';
import 'package:test_app/domain/usecases/characters/search_character.dart';
import 'package:test_app/domain/usecases/episodes/get_all_episodes.dart';


final sl = GetIt.instance;

Future<void> setup() async{

  sl.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl());
  sl.registerLazySingleton<EpisodeRepository>(() => EpisodeRepositoryImp());

  sl.registerLazySingleton<EpisodeDataSource>(() => EpisodeDataSourceImpl(client: sl()));
  sl.registerLazySingleton<CharacterDataSource>(() => CharacterDataSourceImpl(client: sl()));

  sl.registerLazySingleton(() => GetAllEpisodes());
  sl.registerLazySingleton(() => GetAllCharacters());
  sl.registerLazySingleton(() => SearchCharacter());


  sl.registerLazySingleton(() => http.Client());
}