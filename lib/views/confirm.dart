import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sms_sender/vars/variables.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfirmPage extends HookConsumerWidget {
  const ConfirmPage({super.key});

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
                child: Text(
                  messageToBeSent,
                  textAlign: TextAlign.justify,
                ),
              ),
              const Gap(5),
              Center(
                child: Text(
                  listOfContacts.length.toString(),
                ),
              ),
              const Gap(15),
              ElevatedButton(
                onPressed: () {
                  context.push('/done');
                },
                child: const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
