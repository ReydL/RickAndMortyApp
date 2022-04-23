import 'package:test_app/data/data_source/episodes/episode_data_source.dart';
import 'package:test_app/domain/entities/episode_entity.dart';
import 'package:test_app/domain/repositories/episode_repository.dart';
import 'package:test_app/di.dart';

class EpisodeRepositoryImp implements EpisodeRepository{
  final EpisodeDataSource episodeDataSource;

  EpisodeRepositoryImp(): episodeDataSource = sl();
  @override
  Future<List<EpisodeEntity>> filterEpisodes() {
    throw UnimplementedError();
  }

  @override
  Future<List<EpisodeEntity>> getAllEpisodes(int page) async{
    return await episodeDataSource.getAllEpisodes(page);

  }
  
}