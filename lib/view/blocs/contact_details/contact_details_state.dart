part of 'contact_details_bloc.dart';

sealed class ContactDetailsState extends Equatable {
  const ContactDetailsState();

  @override
  List<Object> get props => [];
}

final class ContactDetailsLoading extends ContactDetailsState {}

final class ContactDetailsSuccess extends ContactDetailsState {
  final ContactEntity contact;

  const ContactDetailsSuccess({required this.contact});

  ContactDetailsSuccess copyWith({
    ContactEntity? contact,
  }) {
    return ContactDetailsSuccess(
      contact: contact ?? this.contact,
    );
  }

  @override
  List<Object> get props => [contact];
}

final class ContactDetailsFailure extends ContactDetailsState {
  final String msg;

  const ContactDetailsFailure({required this.msg});

  @override
  List<Object> get props => [msg];
}
