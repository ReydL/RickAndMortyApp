import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/entities/episode_entity.dart';
import 'package:test_app/domain/usecases/episodes/get_all_episodes.dart';
import 'package:test_app/presentation/features/episodes_page/episodes_page_event.dart';
import 'package:test_app/presentation/features/episodes_page/episodes_page_state.dart';
import 'package:test_app/di.dart';

class EpisodesPageBloc extends Bloc<EpisodesPageEvent,EpisodesPageState>{

  final GetAllEpisodes getAllEpisodes;
  int page = 1;
  List<EpisodeEntity> previousEpisodes = [];
  EpisodesPageBloc() :
        getAllEpisodes = sl(),
        super(EpisodesPageInitialState()){


    on<EpisodesPageFetchEvent>((event, emit) async{

      final currentState = state;
      if(currentState is EpisodesPageLoadingState){
         previousEpisodes = currentState.previousEpisodes;
      }
      emit(EpisodesPageLoadingState(previousEpisodes: previousEpisodes));

      try{
        final newEpisodes = await getAllEpisodes(EpisodeParams(page: page));
        final episodes = (state as EpisodesPageLoadingState).previousEpisodes;
        episodes.addAll(newEpisodes);
        emit(EpisodesPageLoadedState(episodes: episodes));
        page++;
      } catch(_){
        emit(EpisodesPageErrorState(message: 'No more episodes'));
      }
    }
    );
  }

}