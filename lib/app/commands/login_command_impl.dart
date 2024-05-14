import '../../core/core.dart';
import '../../domain/domain.dart';
import '../contracts.dart';


class LoginCommandImpl implements LoginCommand {
  final AuthRepo _authRepo;

  LoginCommandImpl({required AuthRepo authRepo}) : _authRepo = authRepo;
  @override
  FutureEitherFailureOr<LoginResponse> call(LoginInputs inputs) async {
    return await _authRepo.login(inputs: inputs);
  }
}
