import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_components/mobile_components.dart';
import 'package:service_center_sales/core/core.dart';
import 'package:service_center_sales/view/view.dart';

import '../../domain/enums/contact_status.dart';
import '../blocs/contact_details/contact_details_bloc.dart';
import '../constants/app_colors.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactDetailsBloc, ContactDetailsState>(
        builder: (context, state) => switch (state) {
              ContactDetailsLoading() => const Scaffold(
                  backgroundColor: AppColors.background,
                  body: Center(
                      child: LoadingWidget(
                    color: Colors.grey,
                    height: 100,
                    width: 100,
                  ))),
              ContactDetailsFailure(:final msg) =>
                Scaffold(body: Center(child: Text(msg))),
              ContactDetailsSuccess(:final contact) => Scaffold(
                  backgroundColor: AppColors.background,
                  appBar: AppBar(
                    title: Text(
                        "${contact.firstName.substring(0, 1).toUpperCase()}${contact.firstName.substring(1)} ${contact.lastName.substring(0, 1).toUpperCase()}${contact.lastName.substring(1)}"),
                  ),
                  bottomNavigationBar: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: kBottomNavigationBarHeight - 10,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8.0, left: 8.0, right: 8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            backgroundColor: Colors.white),
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
                        child: Text(
                          context.tr.submit,
                          style: const TextStyle(
                              color: AppColors.totColor, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  body: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                ImgsManager.placeHolder,
                                height: 300,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  context.tr.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  context.tr.status,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  contact.firstName,
                                  style: const TextStyle(fontSize: 15),
                                ),
                                Text(
                                  widget.currentStatus.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: widget.currentStatus.toString() ==
                                              context.tr.cancelled
                                          ? AppColors.red
                                          : widget.currentStatus.toString() ==
                                                  context.tr.customer
                                              ? AppColors.green
                                              : AppColors.black),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              context.tr.email,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              contact.email,
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              context.tr.city,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              contact.city,
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              context.tr.status,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(context.tr.lead),
                              leading: Radio<ContactStatus>(
                                value: ContactStatus.lead,
                                groupValue: _status,
                                onChanged: _handleRadioValueChanged,
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                context.tr.customer,
                                style: const TextStyle(color: AppColors.green),
                              ),
                              leading: Radio<ContactStatus>(
                                value: ContactStatus.customer,
                                groupValue: _status,
                                onChanged: _handleRadioValueChanged,
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                context.tr.cancelled,
                                style: const TextStyle(color: AppColors.red),
                              ),
                              leading: Radio<ContactStatus>(
                                value: ContactStatus.cancelled,
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
