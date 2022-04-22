
class Pessoa {
  int cod_pessoa;
  String nome;
  String cpf_cnpj;
  String email;
  String telefone;
  String tipo_pessoa;
  int cod_empresa;
  int cod_consultor;

  Pessoa({this.cod_pessoa, this.nome, this.cpf_cnpj, this.email, this.telefone, this.tipo_pessoa, this.cod_empresa, this.cod_consultor});

  Pessoa.fromJson(Map<String, dynamic> json) {
    cod_pessoa = json.containsKey('COD_CLIENTE') ? json['COD_CLIENTE'] : json['PESSOA_CODIGO'] ;
    nome = json['NOME'];
    cpf_cnpj = json['CPF_CNPJ'];
    email = json['EMAIL'];
    telefone = json['TELEFONE'];
    tipo_pessoa = json['TIPO_PESSOA'];
    cod_empresa = json['EMPRESA_CODIGO'];
    cod_consultor = json['CONSULTOR_CODIGO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['COD_CLIENTE'] = this.cod_pessoa;
    data['NOME'] = this.nome;
    data['CPF_CNPJ'] = this.cpf_cnpj;
    data['EMAIL'] = this.email;
    data['TELEFONE'] = this.telefone;
    data['TIPO_PESSOA'] = this.tipo_pessoa;
    data['EMPRESA_CODIGO'] = this.cod_empresa;
    data['CONSULTOR_CODIGO'] = this.cod_consultor;
    return data;
  }



}