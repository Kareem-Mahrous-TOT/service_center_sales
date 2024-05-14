import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class ContactRepoImpl implements ContactRepo {
  final ContactDataSource _contactsDatasource;

  ContactRepoImpl({required ContactDataSource contactDatasource})
      : _contactsDatasource = contactDatasource;

  @override
  FutureEitherFailureOr<List<ContactEntity>> getContacts() async {
    try {
      final result = await _contactsDatasource.getContactDataSource();

      return result.fold((failure) => Left(failure), (json) {
        final didSucceed = (json["isSuccess"] == true);
        List<ContactEntity> contacts = (json['value'] as List)
            .map((e) => ContactEntity.fromJson(e))
            .toList();
        return didSucceed
            ? Right(contacts)
            : Left(ServerFailure(msg: json['errors']));
      });
    } catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    }
  }
}
