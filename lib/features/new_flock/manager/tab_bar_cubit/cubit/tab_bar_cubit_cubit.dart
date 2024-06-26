import 'package:bloc/bloc.dart';
import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:meta/meta.dart';

part 'tab_bar_cubit_state.dart';

class TabBarCubit extends Cubit<TabBarCubitState> {
  TabBarCubit() : super(ActiveTabBarState());
  bool isActive = true;
  void changeType(bool val) {
    isActive = val;
    if (val == true) {
      emit(ActiveTabBarState());
    } else {
      emit(ClosedTabBarState());
    }
  }

}
