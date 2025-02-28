import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:prime_timer/data/network/api_client.dart';
import 'package:prime_timer/data/network/api_exception.dart';
import 'package:prime_timer/data/network/api_failure.dart';
import 'package:prime_timer/data/network/api_urls.dart';

import 'home_repo_imp.dart';

@Injectable(as: HomeRepositoryImp)
class HomeRepository implements HomeRepositoryImp {
  final ApiClient apiClient;

  HomeRepository({required this.apiClient});

  @override
  Future<Either<ApiFailure, dynamic>> getRandomNumber() async {
    try {
      final response = await await apiClient.request(
          url: ApiUrls.random, method: Method.get);

      return Right(response);
    } catch (error, stackTrace) {
      log('$stackTrace');
      return Left(ApiException.handle(error).failure);
    }
  }
}
