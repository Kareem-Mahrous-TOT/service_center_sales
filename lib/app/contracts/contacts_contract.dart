import 'package:service_center_sales/core/inputs/change_status_input.dart';

import '../../core/core.dart';
import '../../domain/entities/contact.dart';
import '../core.dart';

abstract class GetContactsQuery
    extends BaseCommand<FutureEitherFailureOr<List<ContactEntity>>, NoInputs> {}

abstract class ChangeStatusCommand extends BaseCommand<
    FutureEitherFailureOr<ContactEntity>, ChangeStatusInput> {}
