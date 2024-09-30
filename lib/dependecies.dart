import 'package:get_it/get_it.dart';
import 'package:viacep_app/app/stores/bloc/cep_bloc.dart';
import 'package:viacep_app/app/stores/controllers/cep_controller.dart';

void setupDependecies() {
  GetIt i = GetIt.instance;

  i.registerLazySingleton<CepBloc>(() => CepBloc());
  i.registerLazySingleton<CepController>(() => CepController());
}
