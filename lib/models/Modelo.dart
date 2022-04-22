
class Modelo {
  int cod_modelo;
  String descricao;
  int cod_familia;
  int cod_marca;

  Modelo({this.cod_modelo, this.descricao, this.cod_familia, this.cod_marca});

  Modelo.fromJson(Map<String, dynamic> json) {
    cod_modelo = json['MODELO_CODIGO'];
    descricao = json['DESCRICAO'];
    cod_familia = json['FAMILIA_CODIGO'];
    cod_marca = json['MARCA_CODIGO'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MODELO_CODIGO'] = this.cod_modelo;
    data['DESCRICAO'] = this.descricao;
    data['FAMILIA_CODIGO'] = this.cod_familia;
    data['MARCA_CODIGO'] = this.cod_marca;
    return data;
  }


}