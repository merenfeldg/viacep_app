import 'package:flutter/material.dart';
import 'package:viacep_app/app/controllers/cep_controller.dart';
import 'package:viacep_app/app/models/cep_model.dart';
import 'package:viacep_app/app/views/widgets/button_custom.dart';
import 'package:viacep_app/app/views/widgets/card_result_custom.dart';
import 'package:viacep_app/app/views/widgets/input_custom.dart';
import 'package:viacep_app/shared/extensions/extensions.dart';

class CepPage extends StatefulWidget {
  const CepPage({
    super.key,
    required this.controller,
  });

  final CepController controller;

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  final cepModel = CepModel.empty();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: 32.0.paddingHorizontal,
          child: SizedBox(
            width: context.screenWidth,
            height: context.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                150.0.spacingVertical,
                const Text(
                  'VIA CEP',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                16.0.spacingVertical,
                InputCustom(
                  onChanged: cepModel.setCep,
                ),
                16.0.spacingVertical,
                ButtonCustom(
                  onTap: () => widget.controller.fetchCep(cepModel.cep),
                ),
                16.0.spacingVertical,
                ValueListenableBuilder(
                  valueListenable: widget.controller,
                  builder: (_, cep, __) {
                    if (cep.isValid()) {
                      return CardResultCustom(cepModel: cep);
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
