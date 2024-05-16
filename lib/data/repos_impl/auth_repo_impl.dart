import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../../domain/repos.dart';
import '../datasources.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDataSource _authDataSource;

  AuthRepoImpl({
    required AuthDataSource authDataSource,
  }) : _authDataSource = authDataSource;
  @override
  FutureEitherFailureOr<LoginResponse> login(
      {required LoginInputs inputs}) async {
    final result = await _authDataSource.login(inputs);

    return result.fold(
      (failure) {
        log("========>>>$failure");
        return Left(failure);
      },
      (json) {
        final response = LoginResponse.fromJson(json['value']);
        log("========>>>$response");
        return Right(response);
      },
    );
  }
}
