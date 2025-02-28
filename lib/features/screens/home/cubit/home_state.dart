part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  failure,
}

class HomeState extends Equatable {
  final HomeStatus status;
  const HomeState({
    this.status = HomeStatus.initial,
  });

  HomeState copyWith({
    final HomeStatus? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [status];
}
