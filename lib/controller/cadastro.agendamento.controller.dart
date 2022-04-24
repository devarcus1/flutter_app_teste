
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
  Empresa empresa = Empresa();
  @observable
  Veiculo veiculo = Veiculo();
  @observable
  Pessoa pessoa = Pessoa();
  @observable
  Pessoa consultor = Pessoa();
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
  @observable
  bool fazendoCadastro = false;



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

  Future<bool> cadastrarAgendamento() async{
    return await agendamentoRepository.cadastrarAgendamento(agendamento);
  }

   setItensAgendamento(int opcao){
    switch(opcao){
      case 1:
        agendamento.cod_empresa = listEmpresas[selectedItemList].cod_empresa;
        empresa.cod_empresa = listEmpresas[selectedItemList].cod_empresa;
        empresa.nome = listEmpresas[selectedItemList].nome;
        empresa.cnpj = listEmpresas[selectedItemList].cnpj;
        break;
      case 2:
        agendamento.cod_pessoa = listPessoas[selectedItemList].cod_pessoa;
        pessoa.cod_pessoa = listPessoas[selectedItemList].cod_pessoa;
        pessoa.cpf_cnpj = listPessoas[selectedItemList].cpf_cnpj;
        pessoa.nome = listPessoas[selectedItemList].nome;
        break;
      case 3:
        agendamento.cod_veiculo = listVeiculos[selectedItemList].cod_veiculo;
        veiculo.cod_veiculo = listVeiculos[selectedItemList].cod_veiculo;
        veiculo.placa = listVeiculos[selectedItemList].placa;
        veiculo.modelo_descricao = listVeiculos[selectedItemList].modelo_descricao;
        break;
      case 4:
        agendamento.cod_consultor = listConsultores[selectedItemList].cod_consultor;
        consultor.cod_consultor = listConsultores[selectedItemList].cod_consultor;
        consultor.nome = listConsultores[selectedItemList].nome;
        break;
    }
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


  String validarCampos(String label, String text){
    switch(label){

      case 'Código empresa':
      case 'Código pessoa':
      case 'Código veículo':
      case 'Código consultor':
      case 'Data do agendamento':
        if(text.isEmpty)
          return 'Campo $label vazio!';

    }

    return null;

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