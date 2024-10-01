// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart'; 
import 'package:viacep_app/app/models/cep_model.dart';

sealed class CepStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialCepState extends CepStates {}

class SuccessCepState extends CepStates {
  final CepModel model;

  SuccessCepState(this.model);

  @override
  List<Object?> get props => [model];
}

class FailureCepState extends CepStates {
  final String message;

  FailureCepState(this.message);

  @override
  List<Object?> get props => [message];
}
