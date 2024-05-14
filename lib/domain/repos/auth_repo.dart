import '../../core/core.dart';

abstract class AuthRepo {
  FutureEitherFailureOr<LoginResponse> login({
    required LoginInputs inputs,
  });
  FutureEitherFailureOr<bool> register();
}
