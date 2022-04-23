import 'package:flutter/material.dart';
import 'package:test_app/domain/usecases/episodes/get_all_episodes.dart';
import 'package:test_app/presentation/features/characters_page/characters_page_bloc.dart';
import 'package:test_app/presentation/features/characters_page/characters_page_event.dart';
import 'package:test_app/presentation/features/episodes_page/episodes_page_bloc.dart';
import 'package:test_app/presentation/features/episodes_page/episodes_page_event.dart';
import 'package:test_app/presentation/features/route_page/route_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/presentation/features/route_page/route_page_cubit.dart';

import 'package:test_app/di.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.setup();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageRouteCubit(),
        ),
        BlocProvider(
          create: (context) => EpisodesPageBloc()..add(EpisodesPageFetchEvent()),
        ),
        BlocProvider(
          create: (context) => CharactersPageBloc()..add(CharactersPageFetchEvent()),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:  RoutePage(),
      ),
    );
  }
}


