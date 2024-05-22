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
          final didCache = await Future.wait([
            _sharedPrefs.saveString(
                key: LocalKeys.token, value: loginResponse.token),
            _sharedPrefs.saveString(
                key: LocalKeys.userId, value: loginResponse.userId),
            _sharedPrefs.saveString(
                key: LocalKeys.userName, value: loginResponse.userName),
          ]);
          if (didCache.contains(false) ||
              didCache.contains(null)) {
            return const Right(false);
          }
          return const Right(true);
        } catch (e) {
          return Left(CacheFailure(msg: e.toString()));
        }
      },
    );
  }
}
