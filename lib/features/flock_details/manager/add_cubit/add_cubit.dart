import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finalproject/core/utilities/screens.dart';
import 'package:finalproject/features/flock_details/data/api/add_api.dart';
import 'package:finalproject/features/flock_details/data/models/expense_model.dart';
import 'package:finalproject/features/flock_details/data/models/feed_serve_model.dart';
import 'package:finalproject/features/flock_details/data/models/income_model.dart';
import 'package:finalproject/features/flock_details/data/models/medicine_model.dart';
import 'package:finalproject/features/flock_details/data/models/mortality_model.dart';
import 'package:finalproject/features/flock_details/data/models/vaccinantion_model.dart';
import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddInitial());
  String title = 'Save';
  TextEditingController name = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController dateTime = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController method = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController breed = TextEditingController();
  TextEditingController nomOfDead = TextEditingController();
  TextEditingController nomOfBirds = TextEditingController();
  TextEditingController supplier = TextEditingController();

  resetControllers() {
    name.clear();
    quantity.clear();
    dateTime.clear();
    price.clear();
    method.clear();
    note.clear();
    breed.clear();
    nomOfDead.clear();
  }

  pickDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (date != null && date != DateTime.now()) {
      {
        dateTime.text = '${date.day}/${date.month}/${date.year}';
        log(dateTime.text);
      }
    }
  }

// problemmm hereeeeeeeeeee !!!!!!!!!!!!
  createFlock() async {
    try {
      emit(AddLoading());
      final Map<String, dynamic> mp = {
        'flockName': name.text,
        'number': int.parse(nomOfBirds.text),
        'Breed': breed.text,
        'CostPerBirds': price.text,
        'Supplier': supplier.text,
        'Active': true,
      };
      AddApi addApi = AddApi('flock/create/');
      log(mp.toString());
      await addApi.createRecord(mp);
      emit(AddSuccess());
    } on DioException catch (e) {
      catchingError(e);
    }
  }

  createMortality(String flockId) async {
    try {
      emit(AddLoading());
      final mortality = MortalityModel(
          breed: breed.text,
          numberofDead: int.parse(nomOfDead.text),
          note: note.text);
      AddApi addApi = AddApi('morality/create/$flockId');
      await addApi.createRecord(mortality.toJson());
      emit(AddSuccess());
    } on DioException catch (e) {
      catchingError(e);
    }
  }

  createIncome(String flockId) async {
    try {
      emit(AddLoading());
      final income = IncomeModel(
          name: name.text,
          amount: int.parse(price.text),
          category: 'x',
          incomeModelCategory: 'x',
          method: method.text,
          note: note.text);
      log(income.toJson().toString());
      AddApi addApi = AddApi('income/create/$flockId');
      log(income.toJson().toString());
      log(flockId);
      await addApi.createRecord(income.toJson());
      emit(AddSuccess());
    } on DioException catch (e) {
      catchingError(e);
    }
  }

  createExpense(String flockId) async {
    try {
      emit(AddLoading());
      final expenses = ExpenseModel(
          name: name.text,
          amount: int.parse(price.text),
          category: 'x',
          expenseModelCategory: 'x',
          method: method.text,
          note: note.text);
      AddApi addApi = AddApi('expenses/create/$flockId');
      log(expenses.toJson().toString());
      log(flockId);
      await addApi.createRecord(expenses.toJson());
      emit(AddSuccess());
    } on DioException catch (e) {
      catchingError(e);
    }
  }

  createFeedServed(String flockId) async {
    try {
      emit(AddLoading());
      final feed = FeedServedModel(
          name: name.text,
          amount: int.parse(price.text),
          category: 'x',
          note: note.text);
      AddApi addApi = AddApi('feedservied/create/$flockId');
      final String response = await addApi.createRecord(feed.toJson());
      emit(AddSuccess(msg: response));
    } on DioException catch (e) {
      catchingError(e);
    }
  }

  createMedicine(String flockId) async {
    try {
      emit(AddLoading());
      final medicine =
          MedicineModel(name: name.text, breed: breed.text, note: note.text);
      AddApi addApi = AddApi('medician/create/$flockId');
      final String response = await addApi.createRecord(medicine.toJson());
      emit(AddSuccess(msg: response));
    } on DioException catch (e) {
      catchingError(e);
    }
  }

  createVaccine(String flockId) async {
    try {
      emit(AddLoading());
      final vac = VaccinationModel(
          name: name.text,
          breed: breed.text,
          method: method.text,
          discription: ' ',
          vaccinationmodelType: ' ');
      AddApi addApi = AddApi('vaccination/create/$flockId');
      final String response = await addApi.createRecord(vac.toJson());
      emit(AddSuccess(msg: response));
    } on DioException catch (e) {
      catchingError(e);
    }
  }

  String errorMsg(int statusCode) {
    if (statusCode >= 500) {
      return 'Server error occured , please try again later.';
    } else if (statusCode == 401) {
      return 'Sorry , You don\'t have access on this page.';
    } else {
      return 'Oops something went wrong !!';
    }
  }

  catchingError(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      int statusCode = e.response!.statusCode!;
      String error = errorMsg(statusCode);
      emit(AddFalied(errMsg: error));
    } else {
      emit(AddFalied(errMsg: 'Oops something went wrong !!'));
    }
  }
}
