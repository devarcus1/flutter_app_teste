
class Empresa {
  int cod_empresa;
  String nome;
  String cnpj;
  String email;
  String telefone;

  Empresa({this.cod_empresa, this.nome, this.cnpj, this.email, this.telefone});

  Empresa.fromJson(Map<String, dynamic> json) {
    cod_empresa = json['EMPRESA_CODIGO'] ;
    nome = json['NOME'];
    cnpj = json['CNPJ'];
    email = json['EMAIL'];
    telefone = json['TELEFONE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['COD_CLIENTE'] = this.cod_empresa;
    data['NOME'] = this.nome;
    data['CPF_CNPJ'] = this.cnpj;
    data['EMAIL'] = this.email;
    data['TELEFONE'] = this.telefone;
    return data;
  }



}