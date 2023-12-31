import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_practise/views/splash_sreen.dart';
import 'package:provider_practise/controller/my_provider/my_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Myprovider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splashscreen(),
      ),
    );
  }
}
