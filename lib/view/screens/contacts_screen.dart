import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_components/mobile_components.dart';
import 'package:service_center_sales/app/config.dart';

import '../components/contact_card_item.dart';
import '../view.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<ContactsBloc, ContactsState>(builder: (context, state) {
            return switch (state) {
              ContactsLoading() => const LoadingWidget(
                  height: 100,
                  width: 100,
                ),
              ContactsFailure(:final msg) => Text(msg),
              ContactsSuccess(:final contacts) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: contacts.length,
                  itemBuilder: (context, index) => ContactCardItem(
                    imagePath: "assets/images/app_logo.png",
                    name:
                        "${contacts[index].firstName} ${contacts[index].lastName}",
                    description: contacts[index].email,
                    type: contacts[index].city,
                    status: contacts[index].status.toString(),
                    onTap: () => context.goNamed(Routes.contactStatusRoute,
                        pathParameters: {
                          'status': contacts[index].status.toString(),
                          'id': contacts[index].contactId.toString()
                        }),
                  ),
                ),
            };
          })
        ],
      ),
    );
  }
}
