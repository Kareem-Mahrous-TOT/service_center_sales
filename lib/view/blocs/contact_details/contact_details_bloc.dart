import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_center_sales/domain/enums/contact_status.dart';

import '../../../app/contracts.dart';
import '../../../core/inputs/change_status_input.dart';
import '../../../domain/domain.dart';

part 'contact_details_event.dart';
part 'contact_details_state.dart';

class ContactDetailsBloc
    extends Bloc<ContactDetailsEvent, ContactDetailsState> {
  final ChangeStatusCommand _changeStatusCommand;
  ContactDetailsBloc({required ChangeStatusCommand changeStatusCommand})
      : _changeStatusCommand = changeStatusCommand,
        super(ContactDetailsLoading()) {
    on<GetContact>((event, emit) async {
      emit(ContactDetailsLoading());
      await Future.delayed(const Duration(seconds: 1), () {
        emit(ContactDetailsSuccess(
            contact: event.contacts.firstWhere(
          orElse: () => ContactEntity(
              contactId: event.contactId,
              firstName: "firstName",
              lastName: "lastName",
              email: "email",
              gender: "gender",
              city: "city",
              country: "country",
              postalCode: "postalCode",
              status: ContactStatus.lead),
          (element) => element.contactId == event.contactId,
        )));
      });
    });
    on<ChangeStatusEvent>((event, emit) async {
      final result = await _changeStatusCommand
          .call(ChangeStatusInput(id: event.contactId, status: event.status));
      result.fold((failure) => emit(ContactDetailsFailure(msg: failure.msg)),
          (contact) {
        emit(ContactDetailsSuccess(contact: contact));
      });
    });
  }
}
