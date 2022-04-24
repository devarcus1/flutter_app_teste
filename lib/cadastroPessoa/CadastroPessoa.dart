import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_teste/Util/mask.dart';
import 'package:flutter_app_teste/controller/cadastro.pessoa.controller.dart';
import 'package:flutter_app_teste/models/pessoa.dart';
import 'package:flutter_app_teste/models/endereco.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroPessoa extends StatelessWidget {
  TextEditingController nome = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController cpf_cnpj = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController logradouro = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController bairro = TextEditingController();
  TextEditingController complemento = TextEditingController();
  TextEditingController cep = TextEditingController();
  TextEditingController uf = TextEditingController();
  TextEditingController municipio = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final cadastroPessoaController = CadastroPessoaController();
  Pessoa pessoa = Pessoa();
  Endereco endereco = Endereco();

  ExampleMask example = ExampleMask(
      formatter: MaskTextInputFormatter(filter: {"#": RegExp(r'[A-Za-z0-9]')}),
      upperCase: false,
      textInputType: TextInputType.text,
      lenghtField: 60,
      useMask: false,
      permiteEspaco: true);
  final ExampleMask exampleNumbers = ExampleMask(
      formatter: MaskTextInputFormatter(
          mask: "#######", filter: {"#": RegExp(r'[0-9]')}),
      upperCase: false,
      textInputType: TextInputType.number,
      lenghtField: 7,
      useMask: true,
      permiteEspaco: false);
  final ExampleMask exampleTelefone = ExampleMask(
      formatter: MaskTextInputFormatter(
          mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')}),
      upperCase: true,
      textInputType: TextInputType.number,
      lenghtField: 20,
      useMask: true,
      permiteEspaco: true);
  final ExampleMask exampleEmail = ExampleMask(
      formatter: MaskTextInputFormatter(filter: {"#": RegExp(r'[A-Za-z0-9]')}),
      upperCase: false,
      textInputType: TextInputType.emailAddress,
      lenghtField: 60,
      useMask: false,
      permiteEspaco: false);
  final ExampleMask exampleCpf = ExampleMask(
      formatter: MaskTextInputFormatter(
          mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')}),
      upperCase: true,
      textInputType: TextInputType.number,
      lenghtField: 15,
      useMask: true,
      permiteEspaco: false);
  final ExampleMask exampleCnpj = ExampleMask(
      formatter: MaskTextInputFormatter(
          mask: "##.###.###/####-##", filter: {"#": RegExp(r'[0-9]')}),
      upperCase: true,
      lenghtField: 20,
      textInputType: TextInputType.number,
      useMask: true,
      permiteEspaco: false);
  final ExampleMask exampleCEP = ExampleMask(
      formatter: MaskTextInputFormatter(
          mask: "#####-###", filter: {"#": RegExp(r'[0-9]')}),
      upperCase: true,
      textInputType: TextInputType.number,
      lenghtField: 10,
      useMask: true,
      permiteEspaco: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastro Pessoa',
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () async {
                FocusScope.of(context).unfocus();
                if (cadastroPessoaController.validateAndSave(_formKey)) {
                  try {
                    cadastroPessoaController.fazendoCadastro = true;
                    showLoadingIndicator(context);

                    pessoa.nome = nome.text.trim();
                    pessoa.email = email.text.trim();
                    pessoa.cpf_cnpj = cpf_cnpj.text.trim();
                    pessoa.tipo_pessoa =
                        cadastroPessoaController.selectedRadio == 1 ? 'F' : 'J';
                    pessoa.telefone = telefone.text.trim();

                    endereco.logradouro = logradouro.text.trim();
                    if (numero.text.isNotEmpty)
                      endereco.numero = int.parse(numero.text);
                    endereco.bairro = bairro.text.trim();
                    endereco.cep = cep.text;
                    endereco.complemento = complemento.text.trim();
                    endereco.uf = uf.text;
                    endereco.municipio = municipio.text.trim();

                    Pessoa pessoaCadastrada =
                        await cadastroPessoaController.cadastrarPessoa(pessoa);

                    endereco.cod_pessoa = pessoaCadastrada.cod_pessoa;

                    await cadastroPessoaController.cadastrarEndereco(endereco);
                    cadastroPessoaController.fazendoCadastro = false;
                    await Future.delayed(Duration(seconds: 4));
                    Navigator.pop(context);
                    Navigator.pop(context);
                  } on Exception catch (e) {
                    cadastroPessoaController
                        .toast('Ocorreu um erro ao cadastrar...');
                    Navigator.pop(context);
                  }
                }
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                _rowTitle(context,'Dados pessoa'),

                _TextForm(nome, 'Nome', true, example),
                _TextForm(email, 'Email', true, exampleEmail),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Observer(builder: (_) {
                      return Radio(
                        value: 1,
                        groupValue: cadastroPessoaController.selectedRadio,
                        onChanged: (value) {
                          cadastroPessoaController.selectedRadio = value;
                          cadastroPessoaController.labelForm = 'Cpf';
                          cpf_cnpj.text = '';
                        },
                        activeColor: Colors.green,
                      );
                    }),
                    Text(
                      'Cpf',
                      style: TextStyle(fontSize: 14),
                    ),
                    Observer(builder: (_) {
                      return Radio(
                        value: 2,
                        groupValue: cadastroPessoaController.selectedRadio,
                        onChanged: (value) {
                          cadastroPessoaController.selectedRadio = value;
                          cadastroPessoaController.labelForm = 'Cnpj';
                          cpf_cnpj.text = '';
                        },
                        activeColor: Colors.green,
                      );
                    }),
                    Text(
                      'Cnpj',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Observer(builder: (_) {
                        return _TextForm(
                            cpf_cnpj,
                            'Cpf',
                            true,
                            cadastroPessoaController.labelForm == 'Cpf'
                                ? exampleCpf
                                : exampleCnpj);
                      }),
                    ),
                    Expanded(
                        child: _TextForm(
                            telefone, 'Telefone', true, exampleTelefone)),
                  ],
                ),
                _rowTitle(context,'Endereço'),
                _TextForm(logradouro, 'Logradouro', true, example),
                Row(
                  children: [
                    Expanded(
                        child:
                            _TextForm(numero, 'Número', true, exampleNumbers)),
                    Expanded(child: _TextForm(bairro, 'Bairro', true, example)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: _TextForm(cep, 'CEP', true, exampleCEP)),
                    Expanded(
                        child: _TextForm(
                            complemento, 'Complemento', true, example)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: _TextForm(municipio, 'Cidade', true, example),
                    ),
                    Expanded(
                      child: Observer(
                        builder: (_) {
                          return Padding(
                            padding: EdgeInsets.all(
                                cadastroPessoaController.paddingForm),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  filled: true,
                                  hoverColor: Colors.blue.shade100,
                                  border: OutlineInputBorder(),
                                  errorStyle: TextStyle(
                                    color: Colors.red[400],
                                    //fontWeight: FontWeight.bold,
                                    fontSize: 9,
                                  ),
                                ),
                                validator: (String value){
                                  if(value == 'UF')
                                    return 'Escolher um Estado';
                                },
                                isExpanded: true,
                                value: cadastroPessoaController
                                    .dropDownItemSelected,
                                items: cadastroPessoaController.listUF
                                    .map(cadastroPessoaController.buildMenuItem)
                                    .toList(),
                                onChanged: (value) {
                                  cadastroPessoaController
                                      .dropDownItemSelected = value;
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                  ],
                ),
              ],
            )),
      ),
    );
  }

  Widget _TextForm(TextEditingController control, String label, bool _readOnly,
      ExampleMask exampleMask) {
    return Observer(
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(cadastroPessoaController.paddingForm),
          child: TextFormField(
            maxLines: 1,
            showCursor: _readOnly,
            readOnly: !_readOnly,
            controller: control,
            keyboardType: exampleMask.textInputType,
            inputFormatters:
                cadastroPessoaController.getInputsFormatters(exampleMask),
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              filled: true,
              hoverColor: Colors.blue.shade100,
              labelText: label == 'Cpf' || label == 'Cnpj'
                  ? cadastroPessoaController.labelForm
                  : "$label",
              border: OutlineInputBorder(),
              errorStyle: TextStyle(
                color: Colors.red[400],
                //fontWeight: FontWeight.bold,
                fontSize: 9,
              ),
            ),
            validator: (value) {
              return cadastroPessoaController.validarCampos(
                  label == 'Cpf' || label == 'Cnpj'
                      ? cadastroPessoaController.labelForm
                      : label,
                  value); // value.isEmpty ? '$label não pode ser vazio!' : null;
            },
            onSaved: (value) {},
          ),
        );
      },
    );
  }

  Widget _rowTitle(BuildContext context ,String text) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Icon(Icons.circle, size: 10, color: Theme.of(context).primaryColor,),
        ),
        Expanded(
          child: Container(
              padding: EdgeInsets.fromLTRB(5.0, 2.0, 0, 0),
              alignment: Alignment.topLeft,
              child: Text(
                '$text',
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 13.0),
              )),
        ),
      ],
    );
  }

  void showLoadingIndicator(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        bool fazendoCadastro = true;

        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          backgroundColor: Colors.black87,
          content: Container(
              padding: EdgeInsets.all(16),
              color: Colors.black87,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Observer(
                        builder: (_) {
                          return Container(
                              child: cadastroPessoaController.fazendoCadastro
                                  ? CircularProgressIndicator(strokeWidth: 4)
                                  : Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    ),
                              width: 32,
                              height: 32);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Observer(builder: (_) {
                        return Text(
                          cadastroPessoaController.fazendoCadastro
                              ? 'Cadastrando …'
                              : 'Cadastrado com sucesso!',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        );
                      }),
                    )
                  ])),
        );
      },
    );
  }
}
