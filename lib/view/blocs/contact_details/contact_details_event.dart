part of 'contact_details_bloc.dart';

sealed class ContactDetailsEvent extends Equatable {
  const ContactDetailsEvent();

  @override
  List<Object> get props => [];
}

class ChangeStatusEvent extends ContactDetailsEvent {
  final int contactId;
  final String status;

  const ChangeStatusEvent({required this.contactId, required this.status});

  @override
  List<Object> get props => [contactId, status];
}

class GetContact extends ContactDetailsEvent {
  final int contactId;
  final List<ContactEntity> contacts;

  const GetContact({required this.contactId, required this.contacts});

  @override
  List<Object> get props => [contactId, contacts];
}
