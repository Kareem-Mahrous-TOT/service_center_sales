import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class ApiConsumer {
  Future<Either<ServerFailure, Map<String, dynamic>>> get(
      {required String path,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers});
  Future<Either<ServerFailure, Map<String, dynamic>>> post(
      {required String path,
      required Map<String, dynamic> body,
      String? contentType,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters});
  Future<Either<ServerFailure, Map<String, dynamic>>> put({
    required String path,
    required Map<String, Map<String, dynamic>> body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
