import 'package:flutter/material.dart';
import 'package:viacep_app/app/controllers/cep_controller.dart';
import 'package:viacep_app/app/views/cep_page.dart';

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
      home: CepPage(controller: CepController()),
    );
  }
}
