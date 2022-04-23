import 'package:test_app/domain/entities/episode_entity.dart';
import 'package:test_app/domain/repositories/episode_repository.dart';
import 'package:test_app/domain/usecases/base_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/di.dart';

class GetAllEpisodes extends UseCase<List<EpisodeEntity>, EpisodeParams>{

  final EpisodeRepository episodeRepository;

  GetAllEpisodes() : episodeRepository = sl();

  @override
  Future<List<EpisodeEntity>> call(EpisodeParams params) async{
    return await episodeRepository.getAllEpisodes(params.page);

  }

}

class EpisodeParams extends Equatable{
  final int page;

  const EpisodeParams({required this.page});

  @override
  List<Object?> get props => [page];

}