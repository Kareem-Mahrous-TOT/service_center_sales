import 'package:dartz/dartz.dart';

import '../network/error.dart';

typedef FutureEitherFailureOr<T> = Future<Either<Failure, T>>;
