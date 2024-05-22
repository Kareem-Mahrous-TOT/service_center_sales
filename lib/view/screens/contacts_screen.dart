import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_components/mobile_components.dart';

import '../../app/config.dart';
import '../../core/core.dart';
import '../components/contact_card_item.dart';
import '../constants/app_colors.dart';
import '../view.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(context.tr.leads),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                      imagePath: ImgsManager.placeHolder,
                      name:
                          "${contacts[index].firstName} ${contacts[index].lastName}",
                      description: contacts[index].email,
                      type: contacts[index].city,
                      status: contacts[index].status.toString(),
                      statusColor: contacts[index].status.toString() ==
                              context.tr.cancelled
                          ? AppColors.red
                          : contacts[index].status.toString() ==
                                  context.tr.customer
                              ? AppColors.green
                              : AppColors.black,
                      onTap: () => context
                          .goNamed(Routes.contactStatusRoute, pathParameters: {
                        'status': contacts[index].status.toString(),
                        'id': contacts[index].contactId.toString()
                      }),
                    ),
                  ),
              };
            })
          ],
        ),
      ),
    );
  }
}
