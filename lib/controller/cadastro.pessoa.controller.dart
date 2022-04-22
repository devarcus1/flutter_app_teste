
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_teste/Util/mask.dart';
import 'package:flutter_app_teste/models/endereco.dart';
import 'package:flutter_app_teste/models/pessoa.dart';
import 'package:flutter_app_teste/repository/pessoa.repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
part 'cadastro.pessoa.controller.g.dart';

class CadastroPessoaController = _CadastroPessoaController with _$CadastroPessoaController;

abstract class _CadastroPessoaController  with Store{

  final pessoaRepository = PessoaRepository();

  @observable
  int selectedRadio = 1;
  @observable
  String labelForm = 'Cpf';
  @observable
  double paddingForm = 5;
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

  Future<Pessoa> cadastrarPessoa(Pessoa pessoa) async{
    return await pessoaRepository.cadastrarPessoa(pessoa);
  }

  Future<bool> cadastrarEndereco(Endereco endereco) async{
    return await pessoaRepository.cadastrarEndereco(endereco);
  }




  validarCampos(String label, String value){

    switch(label){
      case 'Nome':
        if(value.isEmpty)
          return'$label vazio';
        if(value.length <= 3)
        return '$label muito curto';
        break;
      case 'Cpf':
        if(value.length != 14)
        return '$label inválido!';
        break;
      case 'Cnpj':
        if(value.length != 18)
          return '$label inválido!';
        break;
      case 'UF':
        if(value == 'UF')
          return '$label inválido!';
        break;
      case 'Cidade':
        if(value.isEmpty)
          return '$label vazio!';
        break;
    }
    return null;

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