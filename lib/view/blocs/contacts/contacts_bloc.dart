import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app.dart';
import '../../../core/base/base_callable_class.dart';
import '../../../domain/entities.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final GetContactsQuery _getContactsQuery;

  ContactsBloc({required GetContactsQuery getContactsQuery})
      : _getContactsQuery = getContactsQuery,
        super(ContactsLoading()) {
    on<GetContactsEvent>((event, emit) async {
      emit(ContactsLoading());
      final result = await _getContactsQuery.call(NoInputs());

      final resultingState = result.fold(
        (failure) => ContactsFailure(msg: failure.msg),
        (contacts) => ContactsSuccess(contacts: contacts),
      );

      emit(resultingState);
    });
  }
}
