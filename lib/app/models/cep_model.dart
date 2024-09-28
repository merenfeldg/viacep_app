// ignore_for_file: public_member_api_docs, sort_constructors_first
class CepModel {
  String cep;
  String logradouro;
  String estado;
  String regiao;

  CepModel({
    required this.cep,
    required this.logradouro,
    required this.estado,
    required this.regiao,
  });

  factory CepModel.empty() {
    return CepModel(
      cep: '',
      logradouro: '',
      estado: '',
      regiao: '',
    );
  }

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel(
      cep: map['cep'],
      logradouro: map['logradouro'],
      estado: map['estado'],
      regiao: map['regiao'],
    );
  }

  void setCep(String cep) => this.cep = cep;

  bool isValid() {
    final isCepInvalid = estado == '' || regiao == '' || logradouro == '';

    return isCepInvalid ? false : true;
  }
}
