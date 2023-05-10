
import 'package:flutter/material.dart';

import 'telas/Acoes.dart';
import 'telas/Bitcoin.dart';
import 'telas/PrincipalMoeda.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/principaisMoedas', routes: {
        '/principaisMoedas':(context) => PrincipalMoeda(),
        '/acoes':(context) => Acoes(),
        '/bitcoin':(context) => Bitcoin()
      },
    );
  }
}