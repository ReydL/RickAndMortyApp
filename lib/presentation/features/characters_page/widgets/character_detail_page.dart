import 'package:flutter/material.dart';
import 'package:test_app/domain/entities/character_entity.dart';

class CharacterDetailPage extends StatelessWidget {
  final CharacterEntity character;
  const CharacterDetailPage({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(character.name, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(character.image),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: character.status == 'Alive' ?  Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(width: 5,),
                Text('${character.status} - ${character.species}'),
              ],
            ),
            const SizedBox(height: 10,),
            if(character.type.isNotEmpty) ...buildText('Type of the character', character.type),
            ...buildText('Character\'s gender: ', character.gender),
            ...buildText('Character\'s origin: ', character.origin.name),
            ...buildText('Character\'s last known location: ', character.location.name),
            ...buildText('Data when character was created: ', character.created)
          ],
        ),
      ),
    );
  }
  List<Widget> buildText(String text, String value) {
    return [
      Text(
        text,
        style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
     const  SizedBox(
        height: 4,
      ),
      Text(
        value,
        style:const TextStyle(fontSize: 16),

      ),
      const SizedBox(
        height: 12,
      ),
    ];
  }
}
