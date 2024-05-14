import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../contracts.dart';
import '../core.dart';

class LoginUsecase
    extends BaseUsecase<FutureEitherFailureOr<bool>, LoginInputs> {
  final LoginCommand _loginCommand;
  final SharedPrefs _sharedPrefs;

  LoginUsecase({
    required LoginCommand loginCommand,
    required SharedPrefs sharedPrefs,
  })  : _sharedPrefs = sharedPrefs,
        _loginCommand = loginCommand;

  @override
  FutureEitherFailureOr<bool> call(LoginInputs inputs) async {
    final result = await _loginCommand.call(inputs);

    return result.fold(
      (failure) => Left(failure),
      (loginResponse) async {
        try {
          final didCachePassword = await _sharedPrefs.saveString(
              key: LocalKeys.accessToken, value: loginResponse.accessToken);
          if (didCachePassword ?? false) {
            return const Right(true);
          }

          return const Right(false);
        } catch (e) {
          return Left(CacheFailure(msg: e.toString()));
        }
      },
    );
  }
}
