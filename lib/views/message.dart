import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sms_sender/vars/variables.dart';

class MessagePage extends HookConsumerWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text('Enter the message to be sent'),
              ),
              const Gap(15),
              TextField(
                controller: controller,
                maxLines: 7,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.justify,
                toolbarOptions: const ToolbarOptions(
                  selectAll: true,
                  paste: true,
                  copy: true,
                  cut: false,
                ),
              ),
              const Gap(25),
              ElevatedButton(
                onPressed: () {
                  messageToBeSent = controller.text;
                  context.push('/confirm');
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
