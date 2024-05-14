part of 'contacts_bloc.dart';

sealed class ContactsState extends Equatable {
  const ContactsState();

  @override
  List<Object> get props => [];
}

final class ContactsLoading extends ContactsState {}

final class ContactsSuccess extends ContactsState {
  final List<ContactEntity> contacts;

  const ContactsSuccess({required this.contacts});

  @override
  List<Object> get props => [contacts];
}

final class ContactsFailure extends ContactsState {
  final String msg;

  const ContactsFailure({required this.msg});

  @override
  List<Object> get props => [msg];
}
