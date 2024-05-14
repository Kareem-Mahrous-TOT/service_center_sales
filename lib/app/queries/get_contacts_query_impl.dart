import '../../core/core.dart';
import '../../domain/entities/contact.dart';
import '../../domain/repos/contact_repo.dart';
import '../contracts/contacts_contract.dart';

class GetContactsQueryImpl implements GetContactsQuery {
  final ContactRepo _contactRepo;

  GetContactsQueryImpl({required ContactRepo contactRepo})
      : _contactRepo = contactRepo;
  @override
  FutureEitherFailureOr<List<ContactEntity>> call(NoInputs inputs) async {
    return await _contactRepo.getContacts();
  }
}
