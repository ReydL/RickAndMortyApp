import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/presentation/features/characters_page/characters_page_bloc.dart';
import 'package:test_app/presentation/features/characters_page/characters_page_event.dart';
import 'package:test_app/presentation/features/characters_page/characters_page_state.dart';
import 'package:test_app/presentation/features/characters_page/widgets/character_card.dart';

class SearchCharacterDelegate extends SearchDelegate {
  final _suggestions = [
    'Rick',
    'Morty',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    BlocProvider.of<CharactersPageBloc>(context)
        .add(CharactersPageSearchEvent(query: query));
    return BlocConsumer<CharactersPageBloc, CharactersPageState>(
      listener: (context, state) {
        if(state is CharactersPageErrorState){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is CharactersPageLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CharactersPageLoadedState) {
          final characters = state.characters;
          if (characters.isEmpty) {
            return const Center(
                child: Text('There is no character with this name'));
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                return CharacterCard(character: characters[index]);
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: characters.length);
        }

        return const SizedBox.shrink();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return Text(
          _suggestions[index],
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: _suggestions.length,
    );
  }
}
