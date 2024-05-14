import '../../core/core.dart';
import '../entities/contact.dart';

abstract class ContactRepo {
  FutureEitherFailureOr<List<ContactEntity>> getContacts();
}
