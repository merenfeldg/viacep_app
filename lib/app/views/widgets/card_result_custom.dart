import 'package:flutter/material.dart';
import 'package:viacep_app/app/models/cep_model.dart';
import 'package:viacep_app/shared/extensions/extensions.dart';

class CardResultCustom extends StatelessWidget {
  const CardResultCustom({
    super.key,
    required this.cepModel,
  });

  final CepModel cepModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.fractionallyScreenHeight(0.2),
      width: context.fractionallyScreenWidth(0.8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFf2f2f2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('CEP: ${cepModel.cep}'),
          8.0.spacingVertical,
          Text('RUA: ${cepModel.logradouro}'),
          8.0.spacingVertical,
          Text('ESTADO: ${cepModel.estado}'),
          8.0.spacingVertical,
          Text('REGIAO: ${cepModel.regiao}'),
        ],
      ),
    );
  }
}
