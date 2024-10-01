import 'dart:async';

import 'package:viacep_app/app/stores/bloc_stream/cep_events.dart';
import 'package:viacep_app/app/stores/bloc_stream/cep_states.dart';
import 'package:viacep_app/app/models/cep_model.dart';
import 'package:viacep_app/environment.dart';
import 'package:viacep_app/shared/utils/utils.dart';
import 'package:dio/dio.dart';

class CepBloc {
  CepBloc() {
    _inputStream.stream.listen(_blocEventController);
  }

  final dio = Dio(BaseOptions(baseUrl: apiUrl));

  final _inputStream = StreamController<CepEvents>();
  final _outputStream = StreamController<CepStates>();

  Sink<CepEvents> get input => _inputStream.sink;
  Stream<CepStates> get stream => _outputStream.stream;

  void _blocEventController(CepEvents event) async {

    if (event is FetchCepEvent) {
      try {
        final endpoint = generateEndpointUtils(event.cepModel.cep);
        final json = await dio.get(endpoint);
        final result = CepModel.fromMap(json.data);

        _emit(SuccessCepState(result));
      } catch (e) {
        _emit(FailureCepState('CEP Not Found'));
      }
    }
  }

  void _emit(CepStates state) => _outputStream.add(state);
}