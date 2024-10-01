import 'package:flutter/material.dart';
import 'package:viacep_app/app/views/cep_page.dart';
import 'package:viacep_app/app/views/cep_page_bloc_stream.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CepPage(),
    );
  }
}
