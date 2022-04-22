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
      useMask: false);
  final ExampleMask exampleNumbers = ExampleMask(
      formatter: MaskTextInputFormatter(filter: {"#": RegExp(r'[0-9]')}),
      upperCase: false,
      textInputType: TextInputType.number,
      lenghtField: 20,
      useMask: false);
  final ExampleMask exampleTelefone = ExampleMask(
      formatter: MaskTextInputFormatter(
          mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')}),
      upperCase: true,
      textInputType: TextInputType.number,
      lenghtField: 20,
      useMask: true);
  final ExampleMask exampleEmail = ExampleMask(
      formatter: MaskTextInputFormatter(filter: {"#": RegExp(r'[A-Za-z0-9]')}),
      upperCase: false,
      textInputType: TextInputType.emailAddress,
      lenghtField: 60,
      useMask: false);
  final ExampleMask exampleCpf = ExampleMask(
      formatter: MaskTextInputFormatter(
          mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')}),
      upperCase: true,
      textInputType: TextInputType.number,
      lenghtField: 15,
      useMask: true);
  final ExampleMask exampleCnpj = ExampleMask(
      formatter: MaskTextInputFormatter(
          mask: "##.###.###/####-##", filter: {"#": RegExp(r'[0-9]')}),
      upperCase: true,
      lenghtField: 20,
      textInputType: TextInputType.number,
      useMask: true);
  final ExampleMask exampleCEP = ExampleMask(
      formatter: MaskTextInputFormatter(
          mask: "#####-###", filter: {"#": RegExp(r'[0-9]')}),
      upperCase: true,
      textInputType: TextInputType.number,
      lenghtField: 10,
      useMask: true);
  final ExampleMask exampleUF = ExampleMask(
      formatter: MaskTextInputFormatter(filter: {"#": RegExp(r'[A-Za-z]')}),
      upperCase: true,
      textInputType: TextInputType.text,
      lenghtField: 2,
      useMask: false);

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
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(12.0, 2.0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Dados pessoa',
                      style: TextStyle(color: Colors.blue, fontSize: 12.0),
                    )),
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
                Container(
                    padding: EdgeInsets.fromLTRB(12.0, 2.0, 0, 0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Endereço',
                      style: TextStyle(color: Colors.blue, fontSize: 12.0),
                    )),
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
                                  border: OutlineInputBorder(),
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

                      // DropdownMenuItem(
                      //   value: cadastroPessoaController.dropDownItemSelected, child: null,
                      //
                      // ),
                    )
                    // Expanded(
                    //   child: TypeAheadFormField(
                    //     textFieldConfiguration: TextFieldConfiguration(
                    //       controller: uf,
                    //       decoration: InputDecoration(
                    //         labelText: 'UF'
                    //       ),
                    //     ),
                    //     itemBuilder: (context, suggestion){
                    //       return ListTile(
                    //         title: Text(suggestion),
                    //       );
                    //     },
                    //     suggestionsCallback: (pattern) async {
                    //       Completer<List<String>> completer = new Completer();
                    //       //completer.complete(<String>["cobalt", "copper"]);
                    //       completer.complete(cadastroPessoaController.listUF);
                    //       return completer.future;
                    //       //return cadastroPessoaController.listUF.contains(pattern); //CitiesService.getSuggestions(pattern);
                    //     },
                    //     transitionBuilder: (context, suggestionsBox, controller) {
                    //       return suggestionsBox;
                    //     },
                    //     onSuggestionSelected: (suggestion) {
                    //       uf.text = suggestion;
                    //     },
                    //     // ignore: missing_return
                    //     validator: (value) {
                    //       if (value.isEmpty) {
                    //         return 'Selecione uma UF';
                    //       }
                    //     },
                    //   ),
                    // ),

                    // Expanded(
                    //   child: _TextForm(uf, 'UF', true, exampleUF),
                    // ),
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
