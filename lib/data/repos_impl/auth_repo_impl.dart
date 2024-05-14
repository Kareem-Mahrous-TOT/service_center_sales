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
      (failure) => Left(failure),
      (json) => Right(LoginResponse.fromJson(json)),
    );
  }

  @override
  FutureEitherFailureOr<bool> register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}
