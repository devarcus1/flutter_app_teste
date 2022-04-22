
class Veiculo {
  int cod_veiculo;
  String placa;
  String uf_placa;
  String chassi;
  String cor;
  String ano;
  String km;
  int cod_modelo;
  int cod_pessoa;
  String modelo_descricao;

  Veiculo({this.cod_veiculo, this.placa, this.uf_placa, this.chassi, this.cor, this.ano, this.km, this.cod_modelo, this.cod_pessoa, this.modelo_descricao});

  Veiculo.fromJson(Map<String, dynamic> json) {
    cod_veiculo = json['VEICULO_CODIGO'];
    placa = json['PLACA'];
    uf_placa = json['UF_PLACA'];
    chassi = json['CHASSI'];
    cor = json['COR'];
    ano = json['ANO'];
    km = json['KM'];
    cod_modelo = json['MODELO_CODIGO'];
    cod_pessoa = json['PESSOA_CODIGO'];
    modelo_descricao = json['MODELO_DESCRICAO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VEICULO_CODIGO'] = this.cod_veiculo;
    data['PLACA'] = this.placa;
    data['UF_PLACA'] = this.uf_placa;
    data['CHASSI'] = this.chassi;
    data['COR'] = this.cor;
    data['ANO'] = this.ano;
    data['KM'] = this.km;
    data['MODELO_CODIGO'] = this.cod_modelo;
    data['PESSOA_CODIGO'] = this.cod_pessoa;
    data['MODELO_DESCRICAO'] = this.modelo_descricao;
    return data;
  }



}