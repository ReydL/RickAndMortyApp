import 'package:test_app/domain/entities/episode_entity.dart';

abstract class EpisodeRepository{
  Future<List<EpisodeEntity>> getAllEpisodes(int page);
  Future<List<EpisodeEntity>> filterEpisodes();
}