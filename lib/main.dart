import 'package:flutter/material.dart';

import 'package:onebnpl/app/routes.dart';
import 'package:onebnpl/screens/connectivity.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ConnectivityGate(),
      routes: appRoutes,
    );
  }
}
