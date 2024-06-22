part of 'nav_bar_cubit.dart';

@immutable
sealed class NavBarState {}

final class NavBarInitial extends NavBarState {
  final int idx;

  NavBarInitial(this.idx);
}

final class NavBarPressed extends NavBarState {
  final int idx;
  NavBarPressed(this.idx);
}
