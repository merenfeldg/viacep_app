import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:viacep_app/app/models/cep_model.dart';
import 'package:viacep_app/app/stores/bloc/cep_bloc.dart';
import 'package:viacep_app/app/stores/bloc/cep_events.dart';
import 'package:viacep_app/app/stores/bloc/cep_states.dart';
import 'package:viacep_app/app/views/widgets/button_custom.dart';
import 'package:viacep_app/app/views/widgets/card_result_custom.dart';
import 'package:viacep_app/app/views/widgets/input_custom.dart';
import 'package:viacep_app/shared/extensions/extensions.dart';
import 'package:viacep_app/shared/styles/text_styles.dart';

class CepPage extends StatefulWidget {
  const CepPage({
    super.key,
  });

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  late CepBloc controller;
  final cepModel = CepModel.empty();

  @override
  void initState() {
    super.initState();
    controller = GetIt.instance<CepBloc>();
  }

  void fetchCep(CepModel model) {
    controller.input.add(FetchCepEvent(model));
  }

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
                Text(
                  'VIA CEP',
                  style: TextStyles.h1,
                ),
                16.0.spacingVertical,
                InputCustom(
                  onChanged: cepModel.setCep,
                ),
                16.0.spacingVertical,
                ButtonCustom(
                  onTap: () => fetchCep(cepModel),
                ),
                16.0.spacingVertical,
                StreamBuilder<CepStates>(
                  stream: controller.stream,
                  builder: (_, snapshot) {
                    CepStates? state = snapshot.data;

                    return switch (state) {
                      SuccessCepState(:final model) =>
                        CardResultCustom(cepModel: model),
                      FailureCepState(:final message) => Text(
                          message,
                          style: TextStyles.h1,
                        ),
                      _ => const SizedBox.shrink(),
                    };
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
