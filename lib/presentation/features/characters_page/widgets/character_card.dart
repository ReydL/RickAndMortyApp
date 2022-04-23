import 'package:flutter/material.dart';
import 'package:test_app/domain/entities/character_entity.dart';

class CharacterCard extends StatelessWidget {

  final CharacterEntity character;
  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(character.image),
              ),
            ),
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(character.name,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
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
                const SizedBox(height: 16,),
                const Text('Last known location:'),
                const SizedBox(height: 8,),
                Text(character.location.name),
              ],
            ),
          )
        ],
      ),
    );
  }
}
