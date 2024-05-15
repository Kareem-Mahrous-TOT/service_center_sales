import '../../core/core.dart';
import '../entities/contact.dart';

abstract class ContactRepo {
  FutureEitherFailureOr<List<ContactEntity>> getContacts();
  FutureEitherFailureOr<ContactEntity> changeStatus(
      {required int contactId, required String status});
}
