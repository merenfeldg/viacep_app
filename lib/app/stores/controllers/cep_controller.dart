import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:viacep_app/app/models/cep_model.dart';
import 'package:viacep_app/environment.dart';
import 'package:viacep_app/shared/utils/utils.dart';

class CepController extends ValueNotifier<CepModel> {
  CepController() : super(CepModel.empty());

  final dio = Dio(BaseOptions(baseUrl: apiUrl));

  void fetchCep(String cep) async {
    try {
      final endpoint = generateEndpointUtils(cep);
      final json = await dio.get(endpoint);
      final result = CepModel.fromMap(json.data);

      _updateCep(result);
    } catch (e) {
      _updateCep(CepModel.empty());
    }
  }

  void _updateCep(CepModel model) {
    value = model;
  }
}
