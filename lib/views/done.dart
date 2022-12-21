import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sms_sender/vars/variables.dart';

class DonePage extends HookConsumerWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text('${listDelete.length} contacts has been added!'),
              ),
              const Gap(15),
              ElevatedButton(
                onPressed: () async {
                  for (Contact newContact in listDelete) {
                    await newContact.delete();
                  }
                  listOfContacts.clear();
                  listDelete.clear();
                  // ignore: use_build_context_synchronously
                  context.go('/load');
                },
                child: const Text('Delete & Start Over'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
