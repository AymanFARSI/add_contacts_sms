import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sms_sender/views/confirm.dart';
import 'package:sms_sender/views/done.dart';
import 'package:sms_sender/views/load.dart';
import 'package:sms_sender/views/message.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  initialLocation: '/load',
  routes: [
    GoRoute(
      path: '/load',
      builder: (context, state) => const LoadPage(),
    ),
    GoRoute(
      path: '/message',
      builder: (context, state) => const MessagePage(),
    ),
    GoRoute(
      path: '/confirm',
      builder: (context, state) => const ConfirmPage(),
    ),
    GoRoute(
      path: '/done',
      builder: (context, state) => const DonePage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
