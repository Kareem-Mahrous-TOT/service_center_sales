import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_components/mobile_components.dart';
import 'package:service_center_sales/view/view.dart';

import '../../domain/enums/contact_status.dart';
import '../blocs/contact_details/contact_details_bloc.dart';

class ContactDetailsScreen extends StatefulWidget {
  final int id;
  final ContactStatus? currentStatus;
  const ContactDetailsScreen(
      {super.key, required this.id, required this.currentStatus});

  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
  ContactStatus? _status;

  void _handleRadioValueChanged(ContactStatus? value) {
    setState(() {
      _status = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _status = widget.currentStatus;
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
      context.read<ContactDetailsBloc>().add(GetContact(
          contactId: widget.id,
          contacts: (context.read<ContactsBloc>().state as ContactsSuccess)
              .contacts));
    });
    log("status:========> $_status");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactDetailsBloc, ContactDetailsState>(
        builder: (context, state) => switch (state) {
              ContactDetailsLoading() => const Scaffold(
                    body: Center(
                        child: LoadingWidget(
                  color: Colors.grey,
                  height: 100,
                  width: 100,
                ))),
              ContactDetailsFailure(:final msg) =>
                Scaffold(body: Center(child: Text(msg))),
              ContactDetailsSuccess(:final contact) => Scaffold(
                  appBar: AppBar(
                    title: Text(contact.firstName),
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
                        context.read<ContactDetailsBloc>().add(
                            ChangeStatusEvent(
                                contactId: widget.id,
                                status: _status.toString()));
                        context.read<ContactsBloc>().add(GetContactsEvent());
                        context.pop();
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
                              contact.firstName,
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              contact.email,
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'City',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              contact.city,
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
