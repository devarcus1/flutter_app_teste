
class Agendamento {
  int cod_agendamento;
  int cod_pessoa;
  int cod_veiculo;
  int cod_consultor;
  int cod_empresa;
  String observacao;
  String status;
  DateTime data;


  Agendamento({this.cod_agendamento, this.cod_pessoa, this.cod_veiculo, this.cod_consultor, this.cod_empresa, this.observacao, this.status, this.data});

  Agendamento.fromJson(Map<String, dynamic> json) {
    cod_agendamento = json['AGENDAMENTO_CODIGO'];
    cod_pessoa = json['PESSOA_CODIGO'];
    cod_veiculo = json['VEICULO_CODIGO'];
    cod_consultor = json['PESSOA_EMPRESA_CODIGO'];
    cod_empresa = json['EMPRESA_CODIGO'];
    observacao = json['OBSERVACAO'];
    status = json['STATUS'];
    data = json['DATA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AGENDAMENTO_CODIGO'] = this.cod_agendamento;
    data['PESSOA_CODIGO'] = this.cod_pessoa;
    data['VEICULO_CODIGO'] = this.cod_veiculo;
    data['PESSOA_EMPRESA_CODIGO'] = this.cod_consultor;
    data['EMPRESA_CODIGO'] = this.cod_empresa;
    data['OBSERVACAO'] = this.observacao;
    data['STATUS'] = this.status;
    data['DATA'] = this.data;
    return data;
  }



}