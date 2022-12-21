import 'dart:io';
import 'package:excel/excel.dart';
import 'package:sms_sender/vars/variables.dart';

Future<void> parseFile({required String path}) async {
  var excel = Excel.decodeBytes(File(path).readAsBytesSync());

  listOfContacts.clear();
  listOfContacts.addAll(
    excel.tables[excel.tables.keys.first]!.rows.map(
      (e) => e.first!.value.toString(),
    ),
  );
}
