import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  TextEditingController cnpj_empresa = TextEditingController();

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
      // appBar: AppBar(
      //   title: Text('Cadastro agendamento'),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           salvar(context);
      //         },
      //         icon: Icon(Icons.save)),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SafeArea(
                child: Container(
                  color: Theme.of(context).primaryColor,
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Text('Cadastro agendamento',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                salvar(context);
                              },
                              icon: Icon(
                                Icons.save,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              _rowTitle(context, 'Empresa'),
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
                      child: _TextForm(cnpj_empresa, 'Cnpj', false, false),
                      flex: 1,
                    ),
                  ],
                ),
              ),
              _TextForm(descricao_empresa, 'Empresa', false, false),
              SizedBox(
                height: 10,
              ),
              _rowTitle(context, 'Pessoa'),
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
              SizedBox(
                height: 10,
              ),
              _rowTitle(context, 'Veículo'),
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
                height: 10,
              ),
              _rowTitle(context, 'Consultor'),
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
                              builder: (BuildContext context, Widget child) {
                                return Theme(
                                  data: ThemeData.dark(),
                                  child: child,
                                );
                              });

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
              SizedBox(
                height: 80,
              ),
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
        //inputFormatters: [],
        // cadastroPessoaController.getInputsFormatters(exampleMask),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          filled: true,
          hoverColor: Colors.blue.shade100,
          labelText: "$label",
          border: OutlineInputBorder(),
          errorStyle: TextStyle(
            color: Colors.red[400],
            //fontWeight: FontWeight.bold,
            fontSize: 9,
          ),
        ),
        validator: (value) {
          return cadastroAgendamentoController.validarCampos(
              label,
              control
                  .text); // value.isEmpty ? '$label não pode ser vazio!' : null;
        },
        onSaved: (value) {},
      ),
    );
  }

  void dialogShow(BuildContext context, int opcao) {
    String text = '';
    buscar.text = '';
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
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: ElevatedButton(
                          child: Icon(
                            Icons.search,
                          ),
                          //splashColor: Colors.grey[300],
                          onPressed: () async {
                            // buscar
                            if (buscar.text.length > 0) {
                              cadastroAgendamentoController.limparList();
                              FocusScope.of(context).unfocus();

                              switch (opcao) {
                                case 1:
                                  cadastroAgendamentoController
                                      .buscarEmpresa(buscar.text);
                                  break;
                                case 2:
                                  cadastroAgendamentoController
                                      .buscarPessoa(buscar.text);
                                  break;
                                case 3:
                                  cadastroAgendamentoController
                                      .buscarVeiculo(buscar.text);
                                  break;
                                case 4:
                                  cadastroAgendamentoController
                                      .buscarConsultor(buscar.text);
                                  break;
                              }
                            } else {
                              cadastroAgendamentoController
                                  .toast('Campo de busca vazio!');
                            }
                          },
                        ),
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
                    child: cadastroAgendamentoController.selectedItemList ==
                            9999
                        ? Container()
                        : ElevatedButton(
                            onPressed: () {
                              FocusScope.of(context).unfocus();

                              cadastroAgendamentoController
                                  .setItensAgendamento(opcao);

                              switch (opcao) {
                                case 1:
                                  cod_empresa.text =
                                      cadastroAgendamentoController
                                              .empresa.cod_empresa
                                              .toString() ??
                                          '';
                                  descricao_empresa.text =
                                      cadastroAgendamentoController
                                              .empresa.nome ??
                                          '';
                                  cnpj_empresa.text =
                                      cadastroAgendamentoController
                                              .empresa.cnpj ??
                                          '';
                                  break;
                                case 2:
                                  cod_pessoa.text =
                                      cadastroAgendamentoController
                                              .pessoa.cod_pessoa
                                              .toString() ??
                                          '';
                                  cpf_cnpj.text = cadastroAgendamentoController
                                          .pessoa.cpf_cnpj ??
                                      '';
                                  nome.text = cadastroAgendamentoController
                                          .pessoa.nome ??
                                      '';
                                  break;
                                case 3:
                                  cod_veiculo.text =
                                      cadastroAgendamentoController
                                              .veiculo.cod_veiculo
                                              .toString() ??
                                          '';
                                  placa.text = cadastroAgendamentoController
                                          .veiculo.placa ??
                                      '';
                                  descricao_veiculo.text =
                                      cadastroAgendamentoController
                                              .veiculo.modelo_descricao ??
                                          '';
                                  break;
                                case 4:
                                  cod_consultor.text =
                                      cadastroAgendamentoController
                                              .consultor.cod_consultor
                                              .toString() ??
                                          '';
                                  nome_consultor.text =
                                      cadastroAgendamentoController
                                              .consultor.nome ??
                                          '';
                                  break;
                              }
                              cadastroAgendamentoController.limparList();

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

  Widget _rowTitle(BuildContext context, String text) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Icon(
            Icons.circle,
            size: 10,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Expanded(
          child: Container(
              padding: EdgeInsets.fromLTRB(5.0, 2.0, 0, 0),
              alignment: Alignment.topLeft,
              child: Text(
                '$text',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 13.0),
              )),
        ),
      ],
    );
  }

  void salvar(BuildContext context) async {
    FocusScope.of(context).unfocus();

    if (cadastroAgendamentoController.validateAndSave(_formKey)) {
      try {
        cadastroAgendamentoController.fazendoCadastro = true;
        showLoadingIndicator(context);

        cadastroAgendamentoController.agendamento.observacao =
            observacao.text.trim();

        bool cadastrou =
            await cadastroAgendamentoController.cadastrarAgendamento();

        if (cadastrou) {
          cadastroAgendamentoController.fazendoCadastro = false;
          await Future.delayed(Duration(seconds: 4));
          Navigator.pop(context);
          print('cadastrou!');
          //Navigator.pop(context);
        } else {
          print('erro ao cadastrar');
          cadastroAgendamentoController
              .toast('Ocorreu um erro ao cadastrar...');
          Navigator.pop(context);
        }
      } on Exception catch (e) {
        print('erro ao cadastrar');
        cadastroAgendamentoController.toast('Ocorreu um erro ao cadastrar...');
        Navigator.pop(context);
      }
    }
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
                              child: cadastroAgendamentoController
                                      .fazendoCadastro
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
                          cadastroAgendamentoController.fazendoCadastro
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
