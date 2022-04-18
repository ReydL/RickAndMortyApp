import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NavBarItem{characters,episodes}

class PageRouteState extends Equatable{

  final int index;
  final NavBarItem navBarItem;

  const PageRouteState({required this.index,required this.navBarItem});
  @override
  List<Object?> get props => [];
}

class PageRouteCubit extends Cubit<PageRouteState> {
  PageRouteCubit() : super(const PageRouteState(index: 0,navBarItem: NavBarItem.characters));

  void getNavBarItem(NavBarItem navBarItem) {
    switch (navBarItem) {
      case NavBarItem.characters:

        emit(const PageRouteState(index: 0, navBarItem: NavBarItem.characters));
        break;
      case NavBarItem.episodes:

        emit(const PageRouteState(index: 1,navBarItem: NavBarItem.episodes));
        break;
    }
  }
}