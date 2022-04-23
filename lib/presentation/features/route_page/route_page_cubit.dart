import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NavBarItem { characters, episodes}

class PageRouteState extends Equatable {
  final NavBarItem navbarItem;
  final int index;

  const PageRouteState({required this.navbarItem,required this.index});

  @override
  List<Object> get props => [navbarItem, index];
}

class PageRouteCubit extends Cubit<PageRouteState> {
  PageRouteCubit() : super(const PageRouteState(navbarItem: NavBarItem.characters,index: 0));

  void getNavBarItem(NavBarItem navBarItem) {
    switch (navBarItem) {
      case NavBarItem.characters:
        emit(const PageRouteState(navbarItem: NavBarItem.characters,index: 0));
        break;
      case NavBarItem.episodes:
        emit(const PageRouteState(navbarItem: NavBarItem.episodes,index: 1));
        break;

    }
  }
}

