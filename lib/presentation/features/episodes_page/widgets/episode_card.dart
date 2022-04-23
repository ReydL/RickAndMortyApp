import 'package:flutter/material.dart';
import 'package:test_app/domain/entities/episode_entity.dart';

class EpisodeCard extends StatelessWidget {
  final EpisodeEntity episode;
  const EpisodeCard({Key? key, required this.episode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  ...buildText('Name of Episode', '${episode.name}')
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                children: [
                  ...buildText('Episode:', '${episode.episode}')
                ],
              ),
            ),
            const SizedBox(width: 12,),
            Expanded(
              child: Column(
                children: [
                  ...buildText('Air Date', '${episode.airDate}')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


List<Widget> buildText(String label, String value){
  return[
    Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
    const SizedBox(height: 8),
    Text(value, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center,),
  ];
}
