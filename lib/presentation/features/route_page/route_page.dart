import 'package:flutter/material.dart';
import 'package:test_app/presentation/features/characters_page/characters_page.dart';
import 'package:test_app/presentation/features/episodes_page/episodes_page.dart';
import 'package:test_app/presentation/features/route_page/route_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutePage extends StatefulWidget {
  const RoutePage({Key? key}) : super(key: key);

  @override
  State<RoutePage> createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PageRouteCubit>(context);
    return Scaffold(
      bottomNavigationBar: BlocBuilder<PageRouteCubit, PageRouteState>(
        builder: (context, state) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: 'Characters'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.movie), label: 'Episodes'),
            ],
            currentIndex: state.index,
            onTap: (index) {
              if (index == 0) {
                bloc.getNavBarItem(NavBarItem.characters);
              } else if (index == 1) {
                bloc.getNavBarItem(NavBarItem.episodes);
              }
            },
          );
        },
      ),
      body: BlocBuilder<PageRouteCubit, PageRouteState>(
        builder: (context, state) {
          if (state.navbarItem == NavBarItem.characters) {
            return const CharactersPage();
          } else if (state.navbarItem == NavBarItem.episodes) {
            return const EpisodesPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
