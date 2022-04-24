import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_teste/Util/mask.dart';
import 'package:flutter_app_teste/controller/cadastro.veiculo.controller.dart';
import 'package:flutter_app_teste/models/pessoa.dart';
import 'package:flutter_app_teste/models/veiculo.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroVeiculo extends StatelessWidget {
  TextEditingController placa = TextEditingController();
  TextEditingController ufPlaca = TextEditingController();
  TextEditingController chassi = TextEditingController();
  TextEditingController cor = TextEditingController();
  TextEditingController ano = TextEditingController();
  TextEditingController km = TextEditingController();
  TextEditingController cod_pessoa = TextEditingController();
  TextEditingController cod_modelo = TextEditingController();
  TextEditingController modelo_descricao = TextEditingController();
  TextEditingController buscar = TextEditingController();
  TextEditingController nome_pessoa = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final cadastroVeiculoController = CadastroVeiculoController();
  Veiculo cadastroVeiculo = Veiculo();
  Pessoa pessoaVeiculo = Pessoa();

  final ExampleMask example = ExampleMask(
      formatter: MaskTextInputFormatter(filter: {"#": RegExp(r'[A-Za-z0-9]')}),
      upperCase: false,
      textInputType: TextInputType.text,
      lenghtField: 60,
      useMask: false);
  final ExampleMask examplePLACA = ExampleMask(
      formatter: MaskTextInputFormatter(
          mask: '#######', filter: {"#": RegExp(r'[A-Za-z0-9]')}),
      upperCase: true,
      textInputType: TextInputType.text,
      lenghtField: 7,
      useMask: true);
  final ExampleMask exampleUFPLACA = ExampleMask(
      formatter: MaskTextInputFormatter(
          filter: {"#": RegExp(r'[A-Za-z0-9]')}),
      upperCase: true,
      textInputType: TextInputType.text,
      lenghtField: 2,
      useMask: false);
  final ExampleMask exampleCHASSI = ExampleMask(
      formatter: MaskTextInputFormatter(
          mask: '#################',filter: {"#": RegExp(r'[A-Za-z0-9]')}),
      upperCase: true,
      textInputType: TextInputType.text,
      lenghtField: 17,
      useMask: true);
  final ExampleMask exampleANO = ExampleMask(
      formatter: MaskTextInputFormatter(
          mask: '##/##', filter: {"#": RegExp(r'[0-9]')}),
      upperCase: true,
      textInputType: TextInputType.number,
      lenghtField: 5,
      useMask: true);
  final ExampleMask exampleKM = ExampleMask(
      formatter: MaskTextInputFormatter(
          mask: '#########', filter: {"#": RegExp(r'[0-9]')}),
      upperCase: true,
      textInputType: TextInputType.number,
      lenghtField: 9,
      useMask: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastro Veículo',
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () async {
                FocusScope.of(context).unfocus();
                if (cadastroVeiculoController.validateAndSave(_formKey)) {
                  cadastroVeiculoController.fazendoCadastro = true;
                  showLoadingIndicator(context);

                  cadastroVeiculo = Veiculo();
                  cadastroVeiculo.placa = placa.text;
                  cadastroVeiculo.uf_placa = ufPlaca.text;
                  cadastroVeiculo.chassi = chassi.text;
                  cadastroVeiculo.cor = cor.text;
                  cadastroVeiculo.ano = ano.text;
                  cadastroVeiculo.km = km.text;
                  cadastroVeiculo.cod_pessoa = int.parse(cod_pessoa.text);
                  cadastroVeiculo.cod_modelo = int.parse(cod_modelo.text);

                  bool cadastrado = await cadastroVeiculoController
                      .cadastrarVeiculo(cadastroVeiculo);

                  if (cadastrado) {
                    cadastroVeiculoController.fazendoCadastro = false;
                    await Future.delayed(Duration(seconds: 4));
                    Navigator.pop(context);
                    Navigator.pop(context);
                  } else {
                    cadastroVeiculoController.toast('Ocorreu um erro ao cadastrar...');
                    Navigator.of(context).pop();
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

              SizedBox(height: 10,),
              _rowTitle(context, 'Veículo'),

              Container(
                child: Row(
                  children: [
                    Expanded(
                        child:
                            _TextForm(placa, 'Placa', 5, true, examplePLACA)),
                    // Expanded(
                    //     child: _TextForm(
                    //         ufPlaca, 'UF-Placa', 5, true, exampleUFPLACA)),
                    Expanded(
                      child: Observer(
                        builder: (_) {
                          return Padding(
                            padding: EdgeInsets.all(5),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  filled: true,
                                  hoverColor: Colors.blue.shade100,
                                  border: OutlineInputBorder(),
                                  errorStyle: TextStyle(
                                    color: Colors.red[400],
                                    fontSize: 9,
                                  ),
                                ),
                                validator: (String value){
                                  if(value == 'UF')
                                    return 'Escolher um Estado';
                                },
                                isExpanded: true,
                                value: cadastroVeiculoController
                                    .dropDownItemSelected,
                                items: cadastroVeiculoController.listUF
                                    .map(cadastroVeiculoController.buildMenuItem)
                                    .toList(),
                                onChanged: (value) {
                                  cadastroVeiculoController
                                      .dropDownItemSelected = value;
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),

              _TextForm(chassi, 'Chassi', 5, true, exampleCHASSI),

              Container(
                child: Row(
                  children: [
                    Expanded(child: _TextForm(cor, 'Cor', 5, true, example)),
                    Expanded(child: _TextForm(ano, 'Ano', 5, true, exampleANO)),
                    Expanded(child: _TextForm(km, 'Km', 5, true, exampleKM)),
                  ],
                ),
              ),

              SizedBox(
                height: 5,
              ),
              _rowTitle(context, 'Modelo'),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          child: Icon(Icons.search),
                          onPressed: () {
                            print('click');
                            dialogShow(context, 'Buscar Modelo');
                          },
                        ),

                        Expanded(
                          flex: 1,
                          child: _TextForm(cod_modelo, 'Código Modelo', 5,
                              false, examplePLACA),
                        ),
                        Expanded(
                          child: Container(),
                          flex: 1,
                        ),

                      ],
                    ),
                    _TextForm(modelo_descricao, 'Descrição', 5, false,
                        examplePLACA),
                  ],
                ),
              ),

              SizedBox(
                height: 5,
              ),
              _rowTitle(context, 'Pessoa'),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                          child: Icon(Icons.person_search),
                          onPressed: () {
                            print('click');
                            dialogShow(context, 'Buscar Pessoa');
                          },
                        ),
                        Expanded(
                          flex: 1,
                          child: _TextForm(cod_pessoa, 'Código Pessoa', 5,
                              false, examplePLACA),
                        ),
                        Expanded(
                          child: Container(),
                          flex: 1,
                        ),

                      ],
                    ),
                    _TextForm(nome_pessoa, 'Nome', 5, false, examplePLACA),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _TextForm(TextEditingController control, String label, double padding,
      bool _readOnly, ExampleMask exampleMask) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: TextFormField(
        maxLines: 1,
        showCursor: _readOnly,
        readOnly: !_readOnly,
        controller: control,
        keyboardType: exampleMask.textInputType,
        inputFormatters: cadastroVeiculoController.getInputsFormatters(exampleMask),
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
          return value.isEmpty ? '$label não pode ser vazio!' : null;
        },
        onSaved: (value) {},
      ),
    );
  }

  void dialogShow(BuildContext context, String texto) {
    bool isModelo;
    if (texto == 'Buscar Pessoa') {
      isModelo = false;
      cadastroVeiculoController.labelText = 'Nome';
    }else {
      isModelo = true;
      cadastroVeiculoController.labelText = 'Descrição';
    }


    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Expanded(child: Text('$texto')),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Observer(builder: (_) {
                      return Radio(
                        value: 1,
                        groupValue: cadastroVeiculoController.selectedRadio,
                        onChanged: (value) {
                          cadastroVeiculoController.limparList();
                          cadastroVeiculoController.selectedRadio = value;
                          cadastroVeiculoController.labelText =
                              isModelo ? 'Descrição' : 'Nome';
                        },
                        activeColor: Colors.green,
                      );
                    }),
                    Text(
                      isModelo ? 'Descrição' : 'Nome',
                      style: TextStyle(fontSize: 14),
                    ),
                    Visibility(
                      visible: !isModelo,
                      child: Observer(builder: (_) {
                        return Radio(
                          value: 2,
                          groupValue: cadastroVeiculoController.selectedRadio,
                          onChanged: (value) {
                            cadastroVeiculoController.limparList();
                            cadastroVeiculoController.selectedRadio = value;
                            cadastroVeiculoController.labelText = 'Cpf';
                          },
                          activeColor: Colors.green,
                        );
                      }),
                    ),
                    Visibility(
                      visible: !isModelo,
                      child: Text(
                        'Cpf',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Visibility(
                      visible: !isModelo,
                      child: Observer(builder: (_) {
                        return Radio(
                          value: 3,
                          groupValue: cadastroVeiculoController.selectedRadio,
                          onChanged: (value) {
                            cadastroVeiculoController.limparList();
                            cadastroVeiculoController.selectedRadio = value;
                            cadastroVeiculoController.labelText = 'Cnpj';
                          },
                          activeColor: Colors.green,
                        );
                      }),
                    ),
                    Visibility(
                      visible: !isModelo,
                      child: Text(
                        'Cnpj',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
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
                                labelText: cadastroVeiculoController.labelText,
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
                              cadastroVeiculoController.limparList();
                              FocusScope.of(context).unfocus();
                              if (isModelo) {
                                cadastroVeiculoController
                                    .buscarModelo(buscar.text);
                              } else {
                                cadastroVeiculoController
                                    .buscarPessoa(buscar.text);
                              }

                            } else {
                              cadastroVeiculoController
                                  .toast('Campo de busca vazio!');
                              print('Campo de busca vazio!');
                            }

                            print('PASSOU');
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
                        itemCount: isModelo
                            ? cadastroVeiculoController.listModelos.length
                            : cadastroVeiculoController.listPessoas.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Observer(builder: (__) {
                            return ListTile(
                              title: Text(
                                isModelo
                                    ? '${cadastroVeiculoController.listModelos[index].descricao}'
                                    : '${cadastroVeiculoController.listPessoas[index].cod_pessoa}  -  ${cadastroVeiculoController.listPessoas[index].nome}\nCpf/Cnpj - ${cadastroVeiculoController.listPessoas[index].cpf_cnpj}',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              onTap: () {
                                cadastroVeiculoController.selectedItemList =
                                    index;
                              },
                              selected:
                                  cadastroVeiculoController.selectedItemList ==
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
                      child: cadastroVeiculoController.selectedItemList == 9999
                          ? Container()
                          : ElevatedButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                if (isModelo) {
                                  cadastroVeiculoController
                                      .salveModeloVeiculo();
                                  cod_modelo.text =
                                      cadastroVeiculoController.codigo_modelo;
                                  modelo_descricao.text =
                                      cadastroVeiculoController
                                          .descricao_modelo;
                                } else {
                                  cadastroVeiculoController
                                      .salvePessoaVeiculo();
                                  nome_pessoa.text =
                                      cadastroVeiculoController.nome_pessoa;
                                  cod_pessoa.text =
                                      cadastroVeiculoController.codigo_pessoa;
                                }
                                buscar.text = '';
                                cadastroVeiculoController.limparList();
                                if(!isModelo)
                                  cadastroVeiculoController.validateAndSave(_formKey);
                                Navigator.pop(context);
                              },
                              child: Text( isModelo ? 'Salvar modelo escolhido' : 'Salvar pessoa escolhida')));
                }),
              ],
            ),
          );
        });
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
                              child: cadastroVeiculoController.fazendoCadastro
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
                          cadastroVeiculoController.fazendoCadastro
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

}

