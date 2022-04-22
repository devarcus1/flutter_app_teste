
class Endereco {
  int cod_endereco;
  String logradouro;
  int numero;
  String bairro;
  String complemento;
  String cep;
  String uf;
  String municipio;
  int cod_pessoa;

  Endereco({this.cod_endereco, this.logradouro, this.numero, this.bairro, this.complemento, this.cep, this.uf, this.municipio, this.cod_pessoa});

  Endereco.fromJson(Map<String, dynamic> json) {
    cod_endereco = json['ENDERECO_CODIGO'];
    logradouro = json['LOGRADOURO'];
    numero = json['NUMERO'];
    bairro = json['BAIRRO'];
    complemento = json['COMPLEMENTO'];
    cep = json['CEP'];
    uf = json['UF'];
    municipio = json['MUNICIPIO'];
    cod_pessoa = json['PESSOA_CODIGO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ENDERECO_CODIGO'] = this.cod_endereco;
    data['LOGRADOURO'] = this.logradouro;
    data['NUMERO'] = this.numero;
    data['BAIRRO'] = this.bairro;
    data['COMPLEMENTO'] = this.complemento;
    data['CEP'] = this.cep;
    data['UF'] = this.uf;
    data['MUNICIPIO'] = this.municipio;
    data['PESSOA_CODIGO'] = this.cod_pessoa;
    return data;
  }



}