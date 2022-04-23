import 'package:flutter/material.dart';

import 'package:test_app/presentation/features/characters_page/widgets/characters_list_widget.dart';
import 'package:test_app/presentation/features/characters_page/widgets/search_character_widget.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              showSearch(context: context, delegate: SearchCharacterDelegate());
            },
          ),
        ],
      ),
      body:  CharactersListWidget(),
    );
  }
}
