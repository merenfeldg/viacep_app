// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:viacep_app/app/models/cep_model.dart';

sealed class CepEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchCepEvent extends CepEvents {
  final CepModel cepModel;

  FetchCepEvent(this.cepModel);

  @override
  List<Object?> get props => [cepModel];
}
