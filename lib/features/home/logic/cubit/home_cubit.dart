import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_application/features/home/data/repos/home_repo.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeState.initial());
  final GetAllSpecializationRepo _homeRepo;
  Future<void> getAllSpecialization() async {
    log("hello");
    emit(HomeState.specializationLoading());
    final result = await _homeRepo.getAllSpecialization();
    result.fold(
      (failure) => emit(HomeState.specializationError(failure.errMessage)),
      (responseModel) => emit(HomeState.specializationSuccess(responseModel)),
    );
  }
}
