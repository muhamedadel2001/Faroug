import 'package:bloc/bloc.dart';
import 'package:finalproject/features/flock_details/data/models/expense_model.dart';
import 'package:finalproject/features/flock_details/data/models/flock_data_model.dart';
import 'package:finalproject/features/flock_details/data/models/income_model.dart';
import 'package:finalproject/features/flock_details/data/models/medicine_model.dart';
import 'package:finalproject/features/flock_details/data/models/mortality_model.dart';
import 'package:finalproject/features/flock_details/data/models/vaccinantion_model.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  searchingExpenses(String val, List<FlockDataModel> flocks) {
    if (val.isEmpty) {
      emit(SearchInitial());
    } else {
      List<ExpenseModel> expenseList = flocks.cast<ExpenseModel>();
      List<ExpenseModel> searchedItems = expenseList
          .where((e) => e.name!.toLowerCase().contains(val.toLowerCase()))
          .toList();
      emit(SearchingState(searchedItems));
    }
  }

  searchingIncome(String val, List<FlockDataModel> flocks) {
    if (val.isEmpty) {
      emit(SearchInitial());
    } else {
      List<IncomeModel> expenseList = flocks.cast<IncomeModel>();
      List<IncomeModel> searchedItems = expenseList
          .where((e) => e.name!.toLowerCase().contains(val.toLowerCase()))
          .toList();
      emit(SearchingState(searchedItems));
    }
  }

  searchingMedicine(String val, List<FlockDataModel> flocks) {
    if (val.isEmpty) {
      emit(SearchInitial());
    } else {
      List<MedicineModel> expenseList = flocks.cast<MedicineModel>();
      List<MedicineModel> searchedItems = expenseList
          .where((e) => e.name!.toLowerCase().contains(val.toLowerCase()))
          .toList();
      emit(SearchingState(searchedItems));
    }
  }

  searchingVaccination(String val, List<FlockDataModel> flocks) {
    if (val.isEmpty) {
      emit(SearchInitial());
    } else {
      List<VaccinationModel> expenseList = flocks.cast<VaccinationModel>();
      List<VaccinationModel> searchedItems = expenseList
          .where((e) => e.name!.toLowerCase().contains(val.toLowerCase()))
          .toList();
      emit(SearchingState(searchedItems));
    }
  }

  int getTotalMortality(List<MortalityModel> mortalities) {
    int cnt = 0;
    for (int i = 0; i < mortalities.length; i++) {
      cnt += mortalities[i].numberofDead!;
    }
    return cnt;
  }
}
