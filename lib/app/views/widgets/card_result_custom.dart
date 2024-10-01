import 'package:flutter/material.dart';
import 'package:viacep_app/app/models/cep_model.dart';
import 'package:viacep_app/shared/extensions/extensions.dart';
import 'package:viacep_app/shared/styles/text_styles.dart';

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
          Text(
            'CEP: ${cepModel.cep}',
            style: TextStyles.h2,
          ),
          8.0.spacingVertical,
          Text(
            'ROAD: ${cepModel.logradouro}',
            style: TextStyles.h2,
          ),
          8.0.spacingVertical,
          Text(
            'STATE: ${cepModel.estado}',
            style: TextStyles.h2,
          ),
          8.0.spacingVertical,
          Text(
            'REGION: ${cepModel.regiao}',
            style: TextStyles.h2,
          ),
        ],
      ),
    );
  }
}
