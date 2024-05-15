import 'package:service_center_sales/app/contracts.dart';
import 'package:service_center_sales/core/base/typedefs.dart';
import 'package:service_center_sales/core/inputs/change_status_input.dart';

import '../../domain/domain.dart';

class ChangeStatusCommandImpl implements ChangeStatusCommand {
  final ContactRepo _contactRepo;

  ChangeStatusCommandImpl({required ContactRepo contactRepo})
      : _contactRepo = contactRepo;
  @override
  FutureEitherFailureOr<ContactEntity> call(ChangeStatusInput inputs) async {
    return await _contactRepo.changeStatus(
        contactId: inputs.id, status: inputs.status);
  }
}
