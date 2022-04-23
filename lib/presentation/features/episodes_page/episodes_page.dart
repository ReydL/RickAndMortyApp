import 'package:flutter/material.dart';
import 'package:test_app/presentation/features/episodes_page/widgets/episode_list_widget.dart';

class EpisodesPage extends StatelessWidget {
  const EpisodesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodes'),
        actions: [

        ],
      ),
      body:  EpisodeListWidget(),
    );
  }
}



