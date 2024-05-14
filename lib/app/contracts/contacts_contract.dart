 
import '../../core/core.dart';
import '../../domain/entities/contact.dart';
import '../core.dart';

abstract class GetContactsQuery
    extends BaseCommand<FutureEitherFailureOr<List<ContactEntity>>, NoInputs> {}
