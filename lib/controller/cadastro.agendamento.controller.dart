
import 'package:flutter/material.dart';
import 'package:flutter_app_teste/models/Modelo.dart';
import 'package:flutter_app_teste/models/agendamento.dart';
import 'package:flutter_app_teste/models/empresa.dart';
import 'package:flutter_app_teste/models/pessoa.dart';
import 'package:flutter_app_teste/models/veiculo.dart';
import 'package:flutter_app_teste/repository/agendamento.repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
part 'cadastro.agendamento.controller.g.dart';

class CadastroAgendamentoController = _CadastroAgendamentoController with _$CadastroAgendamentoController;

abstract class _CadastroAgendamentoController  with Store{

  final agendamentoRepository = AgendamentoRepository();

  @observable
  Agendamento agendamento = Agendamento();
  @observable
  ObservableList<Pessoa> listPessoas = ObservableList<Pessoa>();
  @observable
  ObservableList<Veiculo> listVeiculos = ObservableList<Veiculo>();
  @observable
  ObservableList<Empresa> listEmpresas = ObservableList<Empresa>();
  @observable
  ObservableList<Pessoa> listConsultores = ObservableList<Pessoa>();
  @observable
  int selectedRadio = 1;
  @observable
  int selectedItemList = 9999;
  @observable
  String labelText = '';



  @action
  limparList(){
    print('limpar lista Pessoa');
    listPessoas = ObservableList<Pessoa>();
    listVeiculos = ObservableList<Veiculo>();
    listEmpresas = ObservableList<Empresa>();
    selectedItemList = 9999;
  }

  buscarEmpresa(String text) async{
    listEmpresas = await agendamentoRepository.requestEmpresas(text, selectedRadio);
  }
  buscarPessoa(String text) async{
    listPessoas = await agendamentoRepository.requestPessoas(text, selectedRadio);
  }
  buscarVeiculo(String text) async{
    listVeiculos = await agendamentoRepository.requestVeiculos(text, selectedRadio);
  }
  buscarConsultor(String text) async{
    listConsultores = await agendamentoRepository.requestConsultores(text, selectedRadio);
  }



  int getSizeListbyOption(int opcao){
    switch(opcao){
      case 1:
        return listEmpresas.length;
      case 2:
        return listPessoas.length;
      case 3:
        return listVeiculos.length;
      case 4:
        return listConsultores.length;
    }
  }

  String getTextbyOption(int opcao, int index){
    switch(opcao){
      case 1:
        return '${listEmpresas[index].cod_empresa} - ${listEmpresas[index].cnpj}\n${listEmpresas[index].nome}';
      case 2:
        return '${listPessoas[index].cod_pessoa} - ${listPessoas[index].nome}\n${listPessoas[index].cpf_cnpj}';
      case 3:
        return '${listVeiculos[index].cod_veiculo} - ${listVeiculos[index].modelo_descricao}\nPlaca: ${listVeiculos[index].placa}';
    case 4:
      return '${listConsultores[index].cod_consultor} - ${listConsultores[index].nome}\nCod_empresa: ${listConsultores[index].cod_empresa}\ncpf/cnpj: ${listConsultores[index].cpf_cnpj}';
    }
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