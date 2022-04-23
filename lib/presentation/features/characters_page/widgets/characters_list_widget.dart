import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/domain/entities/character_entity.dart';
import 'package:test_app/presentation/features/characters_page/characters_page_bloc.dart';
import 'package:test_app/presentation/features/characters_page/characters_page_event.dart';
import 'package:test_app/presentation/features/characters_page/characters_page_state.dart';

import 'character_card.dart';

class CharactersListWidget extends StatelessWidget {
   CharactersListWidget({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  void setScrollController(context){
    _scrollController.addListener(() {
      if(_scrollController.position.atEdge){
        if(_scrollController.position.pixels != 0){
          BlocProvider.of<CharactersPageBloc>(context).add(CharactersPageFetchEvent());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setScrollController(context);
    List<CharacterEntity> characters = [];
    bool isLoading = false;
    return BlocConsumer<CharactersPageBloc, CharactersPageState>(
      listener: (context,state){
        if(state is CharactersPageErrorState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context,state){
        if(state is CharactersPageLoadingState && characters.isEmpty){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is CharactersPageLoadingState){
          isLoading = true;
        }
        if(state is CharactersPageLoadedState){
          characters.addAll(state.characters);
        }

        return ListView.separated(
            controller: _scrollController,
            itemBuilder: (context,index){
          if(index < characters.length){
            return CharacterCard(character: characters[index],);
          } else {
            Timer(const Duration(milliseconds: 30), () {
              _scrollController
                  .jumpTo(_scrollController.position.maxScrollExtent);
            });
            return const Center(
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child:  CircularProgressIndicator(),
              ),
            );
          }
        }, separatorBuilder: (context,index){
          return  Divider(
            color: Colors.grey.shade700,
          );
        },
            itemCount: characters.length + (isLoading ? 1 : 0));
      },
    );
  }
}
