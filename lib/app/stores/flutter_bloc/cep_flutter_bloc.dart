import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viacep_app/app/models/cep_model.dart';
import 'package:viacep_app/app/stores/bloc_stream/cep_events.dart';
import 'package:viacep_app/app/stores/bloc_stream/cep_states.dart';
import 'package:viacep_app/environment.dart';
import 'package:viacep_app/shared/utils/utils.dart';

class CepFlutterBloc extends Bloc<CepEvents, CepStates> {
  CepFlutterBloc() : super(InitialCepState()) {
    //
    final dio = Dio(BaseOptions(baseUrl: apiUrl));

    on<FetchCepEvent>((event, emit) async {
      try {
        final endpoint = generateEndpointUtils(event.cepModel.cep);
        final json = await dio.get(endpoint);
        final result = CepModel.fromMap(json.data);

        emit(SuccessCepState(result));
      } catch (e) {
        emit(FailureCepState('CEP Not Found'));
      }
    });
  }
}
