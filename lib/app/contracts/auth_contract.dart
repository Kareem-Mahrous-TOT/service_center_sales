import '../../core/core.dart';
import '../core.dart';

abstract class LoginCommand
    extends BaseCommand<FutureEitherFailureOr<LoginResponse>, LoginInputs> {}
