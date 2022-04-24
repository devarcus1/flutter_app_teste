
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_teste/Util/mask.dart';
import 'package:flutter_app_teste/models/Modelo.dart';
import 'package:flutter_app_teste/models/pessoa.dart';
import 'package:flutter_app_teste/models/veiculo.dart';
import 'package:flutter_app_teste/repository/veiculo.repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
part 'cadastro.veiculo.controller.g.dart';

class CadastroVeiculoController = _CadastroVeiculoController with _$CadastroVeiculoController;

abstract class _CadastroVeiculoController  with Store{

  final veiculoRepository = VeiculoRepository();

  @observable
  Pessoa _pessoa = Pessoa();
  @observable
  Veiculo _veiculo = Veiculo();
  @observable
  Modelo _modelo = Modelo();
  @observable
  String nome_pessoa = '';
  @observable
  String codigo_pessoa = '';
  @observable
  String descricao_modelo = '';
  @observable
  String codigo_modelo = '';
  @observable
  ObservableList<Pessoa> listPessoas = ObservableList<Pessoa>();
  @observable
  ObservableList<Modelo> listModelos = ObservableList<Modelo>();
  @observable
  int selectedRadio = 1;
  @observable
  int selectedItemList = 9999;
  @observable
  String labelText = '';
  @observable
  bool fazendoCadastro = false;
  @observable
  List<String> listUF = ['UF','RO','AC','AM','RR','PA','AP','TO','MA','PI','CE','RN','PB','PE','AL','SE','BA','MG','ES','RJ','SP','PR','SC','RS','MS','MT','GO','DF'];
  @observable
  String dropDownItemSelected = 'UF';

  DropdownMenuItem<String> buildMenuItem(String item){
    return DropdownMenuItem(
        value: item,
        child: Text(item)
    );
  }

  @action
  limparList(){
    print('limpar lista Pessoa');
    listPessoas = ObservableList<Pessoa>();
    listModelos = ObservableList<Modelo>();
    selectedItemList = 9999;
  }

  @action
  salvePessoaVeiculo(){
    _pessoa.cod_pessoa = listPessoas[selectedItemList].cod_pessoa;
    _pessoa.nome = listPessoas[selectedItemList].nome;
    _pessoa.telefone = listPessoas[selectedItemList].telefone;
    _pessoa.cpf_cnpj = listPessoas[selectedItemList].cpf_cnpj;
    _pessoa.email = listPessoas[selectedItemList].email;

    nome_pessoa = _pessoa.nome;
    codigo_pessoa = _pessoa.cod_pessoa.toString();

  }

  @action
  salveModeloVeiculo(){
    _modelo.cod_modelo = listModelos[selectedItemList].cod_modelo;
    _modelo.descricao = listModelos[selectedItemList].descricao;
    _modelo.cod_marca = listModelos[selectedItemList].cod_marca;
    _modelo.cod_familia = listModelos[selectedItemList].cod_familia;

    descricao_modelo = _modelo.descricao;
    codigo_modelo = _modelo.cod_modelo.toString();
  }

  buscarPessoa(String text) async{
    listPessoas = await veiculoRepository.requestPessoas(text, selectedRadio);
  }

  buscarModelo(String text) async{
    listModelos = await veiculoRepository.requestModelos(text);
  }

  Future<bool> cadastrarVeiculo(Veiculo veiculo) async{
    return await veiculoRepository.cadastrarVeiculo(veiculo);
  }

  List<TextInputFormatter> getInputsFormatters(ExampleMask exampleMask) {
    List<TextInputFormatter> list = List<TextInputFormatter>();
    if (exampleMask.useMask)
      list.add(exampleMask.formatter);
    else
      list.add(LengthLimitingTextInputFormatter(exampleMask.lenghtField));

    if (exampleMask.upperCase) list.add(UpperCaseTextFormatter());

    return list;
  }

  bool validateAndSave(GlobalKey<FormState> formKey) {
    final FormState form = formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
      return true;
    } else {
      print('Form is invalid');
      return false;
    }
  }

  toast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

}