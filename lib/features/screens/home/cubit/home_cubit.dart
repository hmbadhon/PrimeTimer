import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/app/app_dependency.dart';
import '../../../../core/app/app_preference.dart';
import '../repository/home_repo_imp.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final AppPreferences _appPreferences;
  final HomeRepositoryImp _homeRepository;
  HomeCubit(this._homeRepository)
      : _appPreferences = instance.get(),
        super(HomeState());

  Future<bool> getRandomNumber() async {
    bool status = false;
    emit(state.copyWith(status: HomeStatus.loading));
    final response = await _homeRepository.getRandomNumber();
    response.fold(
      (failure) {
        emit(state.copyWith(status: HomeStatus.failure));
        status = false;
      },
      (data) async {
        emit(state.copyWith(status: HomeStatus.success));
        status = isPrime(data[0]);
        log("isPrime ==========> [$status]");
        if (status) {
          ///TODO: store data in preferences
        }
      },
    );

    return status;
  }

  bool isPrime(int n) {
    if (n < 2) return false;
    if (n == 2 || n == 3) return true;
    if (n % 2 == 0 || n % 3 == 0) return false;

    for (int i = 5; i * i <= n; i += 6) {
      if (n % i == 0 || n % (i + 2) == 0) return false;
    }

    return true;
  }
}
