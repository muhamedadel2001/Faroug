part of 'tab_bar_cubit_cubit.dart';

@immutable
sealed class TabBarCubitState {}

final class ActiveTabBarState extends TabBarCubitState {
  List<FlockModel> filtration(List<FlockModel> myFlocks) {
    List<FlockModel> activeFlocks = [];
    for (int i = 0; i < myFlocks.length; i++) {
      if (myFlocks[i].active == true) {
        activeFlocks.add(myFlocks[i]);
      }
    }
    return activeFlocks;
  }
}

final class ClosedTabBarState extends TabBarCubitState {
  List<FlockModel> filtration(List<FlockModel> myFlocks) {
    List<FlockModel> closedFlocks = [];
    for (int i = 0; i < myFlocks.length; i++) {
      if (myFlocks[i].active == false) {
        closedFlocks.add(myFlocks[i]);
      }
    }
    return closedFlocks;
  }
}
