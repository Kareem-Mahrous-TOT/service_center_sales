import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../core/typedefs.dart';

abstract class AuthDataSource {
  FutureEitherFailureOrMap login(LoginInputs inputs);
}

class AuthDataSourceImpl implements AuthDataSource {
  final ApiConsumer _apiConsumer;

  AuthDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;
  @override
  FutureEitherFailureOrMap login(LoginInputs inputs) async {
    try {
      // final response = await _apiConsumer.post(
      //   path: EndPoints.login,
      //   body: inputs.toJson(),
      // );
      // return response;
      return const Right({"accessToken": "accessToken"});
    } catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}
