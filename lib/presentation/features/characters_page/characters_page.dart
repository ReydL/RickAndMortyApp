import 'package:flutter/material.dart';
import 'package:test_app/presentation/features/characters_page/characters_page_bloc.dart';
import 'package:test_app/presentation/features/characters_page/characters_page_event.dart';

import 'package:test_app/presentation/features/characters_page/widgets/characters_list_widget.dart';
import 'package:test_app/presentation/features/characters_page/widgets/search_character_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersPage extends StatelessWidget {

  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String gender = '';
    String status = '';
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
          IconButton(
            icon: const Icon(Icons.filter_alt_rounded),
            color: Colors.white,
            onPressed: (){
              showDialog(context: context, builder: (context)=> AlertDialog(
                title: const Text('Filter by:'),
                actions: [
                  TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        BlocProvider.of<CharactersPageBloc>(context).add(CharacterPageFilterEvent(gender: gender, status: status));
                        Navigator.of(context).pop();
                      }),
                  TextButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
                content: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      const Text('Gender:'),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          ElevatedButton(onPressed: ()=> gender = 'female', child: const Text('Female')),
                          const SizedBox(width: 5,),
                          ElevatedButton(onPressed: ()=> gender = 'male', child: const Text('Male')),
                          const SizedBox(width: 5,),
                          ElevatedButton(onPressed: ()=> gender = 'unknown', child: const Text('Uknown')),
                        ],
                      ),
                      const Text('Status: '),
                      Row(
                        children: [
                          ElevatedButton(onPressed: ()=> status = 'alive', child: const Text('Alive')),
                          const SizedBox(width: 5,),
                          ElevatedButton(onPressed: ()=> status = 'dead', child: const Text('dead')),
                          const SizedBox(width: 5,),
                          ElevatedButton(onPressed: ()=> status = 'unknown', child: const Text('Uknown')),
                        ],
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
              ));
            },
          )
        ],
      ),
      body:  CharactersListWidget(),
    );
  }
}
