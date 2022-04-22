import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_teste/controller/cadastro.agendamento.controller.dart';
import 'package:flutter_app_teste/models/agendamento.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

class CadastroAgendamento extends StatelessWidget {
  TextEditingController cod_pessoa = TextEditingController();
  TextEditingController nome = TextEditingController();
  TextEditingController cpf_cnpj = TextEditingController();

  TextEditingController cod_veiculo = TextEditingController();
  TextEditingController descricao_veiculo = TextEditingController();
  TextEditingController placa = TextEditingController();

  TextEditingController cod_empresa = TextEditingController();
  TextEditingController descricao_empresa = TextEditingController();

  TextEditingController cod_consultor = TextEditingController();
  TextEditingController nome_consultor = TextEditingController();
  TextEditingController data_agendamento = TextEditingController();
  TextEditingController observacao = TextEditingController();

  TextEditingController buscar = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final cadastroAgendamentoController = CadastroAgendamentoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro agendamento'),
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
              Container(
                  padding: EdgeInsets.fromLTRB(12.0, 8.0, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Empresa',
                    style: TextStyle(color: Colors.blue, fontSize: 12.0),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      child: Icon(Icons.search),
                      onPressed: () {
                        print('click');
                        dialogShow(context, 1);
                      },
                    ),
                    Expanded(
                      flex: 1,
                      child: _TextForm(
                          cod_empresa, 'Código empresa', false, false),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              _TextForm(descricao_empresa, 'Empresa', false, false),
              Container(
                  padding: EdgeInsets.fromLTRB(12.0, 8.0, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Pessoa',
                    style: TextStyle(color: Colors.blue, fontSize: 12.0),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      child: Icon(Icons.search),
                      onPressed: () {
                        print('click');
                        dialogShow(context, 2);
                      },
                    ),
                    Expanded(
                      flex: 1,
                      child:
                          _TextForm(cod_pessoa, 'Código pessoa', false, false),
                    ),
                    Expanded(
                      child: _TextForm(cpf_cnpj, 'Cpf/Cnpj', false, false),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              _TextForm(nome, 'Nome', false, false),
              Container(
                  padding: EdgeInsets.fromLTRB(12.0, 8.0, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Veiculo',
                    style: TextStyle(color: Colors.blue, fontSize: 12.0),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      child: Icon(Icons.search),
                      onPressed: () {
                        print('click');
                        dialogShow(context, 3);
                      },
                    ),
                    Expanded(
                      flex: 1,
                      child: _TextForm(
                          cod_veiculo, 'Código veículo', false, false),
                    ),
                    Expanded(
                      child: _TextForm(placa, 'Placa', false, false),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              _TextForm(descricao_veiculo, 'Modelo', false, false),
              SizedBox(
                height: 5,
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(12.0, 8.0, 0, 0),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Consultor',
                    style: TextStyle(color: Colors.blue, fontSize: 12.0),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      child: Icon(Icons.search),
                      onPressed: () {
                        dialogShow(context, 4);
                      },
                    ),
                    Expanded(
                      flex: 1,
                      child: _TextForm(
                          cod_consultor, 'Código consultor', false, false),
                    ),
                    Expanded(
                      child: Container(),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              _TextForm(nome_consultor, 'Nome', false, false),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: ElevatedButton(
                        onPressed: () async {
                          DateTime datetime = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(DateTime.now().year),
                              lastDate: DateTime(DateTime.now().year + 10),
                              builder: (BuildContext context, Widget child) {
                                return Theme(
                                  data: ThemeData.dark(),
                                  child: child,
                                );
                              });
                          TimeOfDay picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          DateTime data = new DateTime(
                              datetime.year,
                              datetime.month,
                              datetime.day,
                              picked.hour,
                              picked.minute);
                          cadastroAgendamentoController.agendamento.data = data;
                          data_agendamento.text =
                              DateFormat('dd/MM/yyyy – kk:mm').format(data);
                        },
                        child: Icon(Icons.calendar_today_outlined)),
                  ),
                  Expanded(
                      child: _TextForm(data_agendamento, 'Data do agendamento',
                          false, false)),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              _TextForm(observacao, 'Observação', true, true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _TextForm(TextEditingController control, String label, bool _readOnly,
      bool maxLenght) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: TextFormField(
        maxLength: maxLenght ? 100 : null,
        showCursor: _readOnly,
        readOnly: !_readOnly,
        controller: control,
        //keyboardType: exampleMask.textInputType,
        // inputFormatters:
        // cadastroPessoaController.getInputsFormatters(exampleMask),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: "$label",
          border: OutlineInputBorder(),
          errorStyle: TextStyle(
            color: Colors.red[400],
            //fontWeight: FontWeight.bold,
            fontSize: 9,
          ),
        ),
        // validator: (value) {
        //   return cadastroPessoaController.validarCampos(
        //       label == 'Cpf' || label == 'Cnpj'
        //           ? cadastroPessoaController.labelForm
        //           : label,
        //       value); // value.isEmpty ? '$label não pode ser vazio!' : null;
        // },
        onSaved: (value) {},
      ),
    );
  }

  void dialogShow(BuildContext context, int opcao) {
    String text = '';
    cadastroAgendamentoController.selectedRadio = 1;
    switch (opcao) {
      case 1:
        cadastroAgendamentoController.labelText = 'Nome';
        text = 'Buscar empresa';
        break;
      case 2:
        text = 'Buscar pessoa';
        cadastroAgendamentoController.labelText = 'Nome';
        break;
      case 3:
        text = 'Buscar veículo';
        cadastroAgendamentoController.labelText = 'Descrição';
        break;
      case 4:
        text = 'Buscar consultor';
        cadastroAgendamentoController.labelText = 'Nome';
        break;
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Expanded(child: Text('$text')),
                IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                getRow(opcao),
                Container(
                  width: MediaQuery.of(context).size.width,
                  //height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        child: Observer(
                          builder: (_) {
                            return TextField(
                              controller: buscar,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelText:
                                    cadastroAgendamentoController.labelText,
                                border: OutlineInputBorder(),
                              ),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        child: Icon(
                          Icons.search,
                        ),
                        //splashColor: Colors.grey[300],
                        onPressed: () async {
                          // buscar
                          if (buscar.text.length > 0) {
                            cadastroAgendamentoController.limparList();
                            FocusScope.of(context).unfocus();

                            switch(opcao){
                              case 1:
                                cadastroAgendamentoController.buscarEmpresa(buscar.text);
                                break;
                              case 2:
                                cadastroAgendamentoController.buscarPessoa(buscar.text);
                                break;
                              case 3:
                                cadastroAgendamentoController.buscarVeiculo(buscar.text);
                                break;
                              case 4:
                                cadastroAgendamentoController.buscarConsultor(buscar.text);
                                break;
                            }

                          } else {
                            cadastroAgendamentoController
                                .toast('Campo de busca vazio!');
                          }

                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    child: Observer(builder: (_) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: cadastroAgendamentoController
                            .getSizeListbyOption(opcao),
                        itemBuilder: (BuildContext context, int index) {
                          return Observer(builder: (__) {
                            return ListTile(
                              title: Text(
                                '${cadastroAgendamentoController.getTextbyOption(opcao, index)}',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              onTap: () {
                                cadastroAgendamentoController.selectedItemList =
                                    index;
                              },
                              selected: cadastroAgendamentoController
                                      .selectedItemList ==
                                  index,
                            );
                          });
                        },
                      );
                    }),
                  ),
                ),
                Observer(builder: (_) {
                  return Visibility(
                    child:
                        cadastroAgendamentoController.selectedItemList == 9999
                            ? Container()
                            : ElevatedButton(
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  // if (isModelo) {
                                  //   cadastroVeiculoController
                                  //       .salveModeloVeiculo();
                                  //   cod_modelo.text =
                                  //       cadastroVeiculoController.codigo_modelo;
                                  //   modelo_descricao.text =
                                  //       cadastroVeiculoController
                                  //           .descricao_modelo;
                                  // } else {
                                  //   cadastroVeiculoController
                                  //       .salvePessoaVeiculo();
                                  //   nome_pessoa.text =
                                  //       cadastroVeiculoController.nome_pessoa;
                                  //   cod_pessoa.text =
                                  //       cadastroVeiculoController.codigo_pessoa;
                                  // }
                                  // buscar.text = '';
                                  // cadastroVeiculoController.limparList();
                                  // if(!isModelo)
                                  //   cadastroVeiculoController.validateAndSave(_formKey);
                                  Navigator.pop(context);
                                },
                                child: Text('Salvar')),
                  );
                }),
              ],
            ),
          );
        });
  }

  Widget getRow(int opcao) {
    switch (opcao) {
      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _radio('Nome', 1),
            Text(
              'Nome',
              style: TextStyle(fontSize: 14),
            ),
            _radio('Cnpj', 2),
            Text(
              'Cnpj',
              style: TextStyle(fontSize: 14),
            ),
          ],
        );
        break;
      case 2:
      case 4:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _radio('Nome', 1),
            Text(
              'Nome',
              style: TextStyle(fontSize: 14),
            ),
            _radio('Cpf', 2),
            Text(
              'Cpf',
              style: TextStyle(fontSize: 14),
            ),
            _radio('Cnpj', 3),
            Text(
              'Cnpj',
              style: TextStyle(fontSize: 14),
            ),
          ],
        );
      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _radio('Placa', 1),
            Text(
              'Placa',
              style: TextStyle(fontSize: 14),
            ),
            _radio('Cpf', 2),
            Text(
              'Cpf',
              style: TextStyle(fontSize: 14),
            ),
            _radio('Cnpj', 3),
            Text(
              'Cnpj',
              style: TextStyle(fontSize: 14),
            ),
          ],
        );
    }
  }

  _radio(String text, int value) {
    return Observer(builder: (_) {
      return Radio(
        value: value,
        groupValue: cadastroAgendamentoController.selectedRadio,
        onChanged: (value) {
          cadastroAgendamentoController.limparList();
          cadastroAgendamentoController.selectedRadio = value;
          cadastroAgendamentoController.labelText = '$text';
        },
        activeColor: Colors.green,
      );
    });
  }
}
