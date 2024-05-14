import 'package:equatable/equatable.dart';

import '../enums/contact_status.dart';

class ContactEntity extends Equatable {
  final int contactId;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String city;
  final String country;
  final String postalCode;
  final ContactStatus status;

  const ContactEntity({
    required this.contactId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.city,
    required this.country,
    required this.postalCode,
    required this.status,
  });

  @override
  List<Object?> get props => [
        contactId,
        status,
        firstName,
        lastName,
        email,
        gender,
        city,
        country,
        postalCode,
      ];

  factory ContactEntity.fromJson(Map<String, dynamic> map) {
    return ContactEntity(
      contactId: map['contactId'] as int,
      status: ContactStatus.fromString(map['status'] as String),
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      gender: map['gender'],
      city: map['city'] as String,
      country: map['country'] as String,
      postalCode: map['postalCode'] as String,
    );
  }
}
