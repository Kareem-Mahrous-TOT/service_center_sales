import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_components/mobile_components.dart';
import 'package:service_center_sales/domain/entities/contact.dart';

import '../../domain/enums/contact_status.dart';
import '../view.dart';

class ContactStatusScreen extends StatefulWidget {
  final int id;
  const ContactStatusScreen({super.key, required this.id});

  @override
  State<ContactStatusScreen> createState() => _ContactStatusScreenState();
}

class _ContactStatusScreenState extends State<ContactStatusScreen> {
  ContactStatus? _status = ContactStatus.lead;

  void _handleRadioValueChanged(ContactStatus? value) {
    setState(() {
      _status = value;
    });
  }

  @override
  void initState() {
    //TODO: add getContactById

    // context.read<DoctorBloc>().add(DoctorEvent.getDoctorById(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const ContactEntity dummyContact = ContactEntity(
      contactId: 0,
      firstName: "firstName",
      lastName: "lastName",
      email: "email",
      gender: "gender",
      city: "city",
      country: "country",
      postalCode: "postalCode",
      status: ContactStatus.lead,
    );
    return BlocBuilder<ContactsBloc, ContactsState>(
        builder: (context, state) => switch (state) {
              ContactsLoading() => const LoadingWidget(
                  height: 100,
                  width: 100,
                ),
              ContactsFailure(:final msg) => Text(msg),
              ContactsSuccess(:final contacts) => Scaffold(
                  appBar: AppBar(
                    title: Text(contacts
                        .firstWhere(
                            orElse: () => dummyContact,
                            (element) => element.contactId == widget.id)
                        .firstName),
                  ),
                  bottomNavigationBar: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: kBottomNavigationBarHeight - 10,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          backgroundColor: Colors.greenAccent),
                      onPressed: () {
                        // Handle the form submission here
                        log('Selected Contact Status: $_status');
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                  body: Container(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                "assets/images/app_logo.png",
                                height: 300,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              contacts
                                  .firstWhere(
                                      orElse: () => dummyContact,
                                      (element) =>
                                          element.contactId == widget.id)
                                  .firstName,
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              contacts
                                  .firstWhere(
                                      orElse: () => dummyContact,
                                      (element) =>
                                          element.contactId == widget.id)
                                  .email,
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'City',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              contacts
                                  .firstWhere(
                                      orElse: () => dummyContact,
                                      (element) =>
                                          element.contactId == widget.id)
                                  .city,
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Status',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Lead'),
                              leading: Radio<ContactStatus>(
                                value: ContactStatus.lead,
                                groupValue: _status,
                                onChanged: _handleRadioValueChanged,
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Cancelled'),
                              leading: Radio<ContactStatus>(
                                value: ContactStatus.cancelled,
                                groupValue: _status,
                                onChanged: _handleRadioValueChanged,
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Customer'),
                              leading: Radio<ContactStatus>(
                                value: ContactStatus.customer,
                                groupValue: _status,
                                onChanged: _handleRadioValueChanged,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
            });
  }
}
