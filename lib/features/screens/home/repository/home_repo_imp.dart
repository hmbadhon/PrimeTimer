import 'package:dartz/dartz.dart';

import '../../../../data/network/api_failure.dart';

abstract class HomeRepositoryImp {
  Future<Either<ApiFailure, dynamic>> getRandomNumber();
}
