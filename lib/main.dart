import 'package:flutter/material.dart';
import 'package:test_app/presentation/features/route_page/route_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/presentation/features/route_page/route_page_cubit.dart';

void main() {
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
        )
      ],
      child: const MaterialApp(
        home:  RoutePage(),
      ),
    );
  }
}


