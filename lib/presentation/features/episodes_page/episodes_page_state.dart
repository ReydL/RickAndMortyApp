import 'package:equatable/equatable.dart';
import 'package:test_app/domain/entities/episode_entity.dart';

class EpisodesPageState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EpisodesPageInitialState extends EpisodesPageState{}

class EpisodesPageLoadingState extends EpisodesPageState{}

class EpisodesPageLoadedState extends EpisodesPageState{
  final List<EpisodeEntity> episodes;

  EpisodesPageLoadedState({required this.episodes});

  @override
  // TODO: implement props
  List<Object?> get props => [episodes];
}

class EpisodesPageErrorState extends EpisodesPageState{
  final String message;

  EpisodesPageErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}