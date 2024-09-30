import 'package:get_it/get_it.dart';
import 'package:viacep_app/app/stores/bloc_stream/cep_bloc.dart';
import 'package:viacep_app/app/stores/controllers/cep_controller.dart';
import 'package:viacep_app/app/stores/flutter_bloc/cep_flutter_bloc.dart';

void setupDependecies() {
  GetIt i = GetIt.instance;

  i.registerLazySingleton<CepBloc>(() => CepBloc());
  i.registerLazySingleton<CepController>(() => CepController());
  i.registerLazySingleton<CepFlutterBloc>(() => CepFlutterBloc());
}
