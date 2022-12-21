import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:sms_sender/vars/variables.dart';

Future<void> addContacts() async {
  for (String number in listOfContacts) {
    // Insert new contact
    final newContact = Contact()
      ..name.first = 'John'
      ..name.last = 'Smith'
      ..phones = [Phone(number)];
    await newContact.insert();
    listDelete.add(newContact);
  }
}
