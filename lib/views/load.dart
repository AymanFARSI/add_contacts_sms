import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sms_sender/src/add_contacts.dart';
import 'package:sms_sender/src/read_excel.dart';

class LoadPage extends HookConsumerWidget {
  const LoadPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final msg = useState('Upload the excel file');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Send SMS'),
      ),
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
                  msg.value,
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Gap(15),
              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['xlsx'],
                  );
                  if (result != null) {
                    try {
                      await parseFile(path: result.files.single.path!);
                      await addContacts();
                      // ignore: use_build_context_synchronously
                      context.push('/done');
                      // context.push('/message');
                    } on Exception {
                      msg.value =
                          'Error when reading/adding contacts.\nTry again!';
                    }
                  } else {
                    // User canceled the picker
                  }
                },
                child: const Text('Choose file'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
