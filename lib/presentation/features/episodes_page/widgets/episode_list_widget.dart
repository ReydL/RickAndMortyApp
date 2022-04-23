import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/presentation/features/episodes_page/episodes_page_event.dart';

import '../../../../domain/entities/episode_entity.dart';
import '../episodes_page_bloc.dart';
import '../episodes_page_state.dart';
import 'episode_card.dart';

class EpisodeListWidget extends StatelessWidget {
  EpisodeListWidget({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  void setScrollController(context){
    _scrollController.addListener(() {
      if(_scrollController.position.atEdge){
        if(_scrollController.position.pixels != 0){
          BlocProvider.of<EpisodesPageBloc>(context).add(EpisodesPageFetchEvent());
        }
      }
    });
  }
  List<EpisodeEntity> episodes = [];
  @override
  Widget build(BuildContext context) {
    setScrollController(context);
    bool isLoading = false;
    return BlocConsumer<EpisodesPageBloc,EpisodesPageState>(
      listener: (context,state){
        if(state is EpisodesPageErrorState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context,state){
      if(state is EpisodesPageLoadingState && episodes.isEmpty){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if(state is EpisodesPageLoadingState){
        isLoading = true;
      }
      if(state is EpisodesPageLoadedState){
        episodes.addAll(state.episodes);
      }

      return ListView.separated(
          controller: _scrollController,
          itemBuilder: (context,index){
        if(index < episodes.length){
          return EpisodeCard(episode: episodes[index]);
        } else {
          return const Center(
            child: Padding(
              padding:  EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          );
        }
      }, separatorBuilder: (context,index){
        return  Divider(
          color: Colors.grey.shade700,
        );
      }, itemCount: episodes.length + (isLoading ? 1 :0));
    },
    );
  }
}



