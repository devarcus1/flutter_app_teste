// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro.veiculo.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroVeiculoController on _CadastroVeiculoController, Store {
  final _$_pessoaAtom = Atom(name: '_CadastroVeiculoController._pessoa');

  @override
  Pessoa get _pessoa {
    _$_pessoaAtom.reportRead();
    return super._pessoa;
  }

  @override
  set _pessoa(Pessoa value) {
    _$_pessoaAtom.reportWrite(value, super._pessoa, () {
      super._pessoa = value;
    });
  }

  final _$_veiculoAtom = Atom(name: '_CadastroVeiculoController._veiculo');

  @override
  Veiculo get _veiculo {
    _$_veiculoAtom.reportRead();
    return super._veiculo;
  }

  @override
  set _veiculo(Veiculo value) {
    _$_veiculoAtom.reportWrite(value, super._veiculo, () {
      super._veiculo = value;
    });
  }

  final _$_modeloAtom = Atom(name: '_CadastroVeiculoController._modelo');

  @override
  Modelo get _modelo {
    _$_modeloAtom.reportRead();
    return super._modelo;
  }

  @override
  set _modelo(Modelo value) {
    _$_modeloAtom.reportWrite(value, super._modelo, () {
      super._modelo = value;
    });
  }

  final _$nome_pessoaAtom =
      Atom(name: '_CadastroVeiculoController.nome_pessoa');

  @override
  String get nome_pessoa {
    _$nome_pessoaAtom.reportRead();
    return super.nome_pessoa;
  }

  @override
  set nome_pessoa(String value) {
    _$nome_pessoaAtom.reportWrite(value, super.nome_pessoa, () {
      super.nome_pessoa = value;
    });
  }

  final _$codigo_pessoaAtom =
      Atom(name: '_CadastroVeiculoController.codigo_pessoa');

  @override
  String get codigo_pessoa {
    _$codigo_pessoaAtom.reportRead();
    return super.codigo_pessoa;
  }

  @override
  set codigo_pessoa(String value) {
    _$codigo_pessoaAtom.reportWrite(value, super.codigo_pessoa, () {
      super.codigo_pessoa = value;
    });
  }

  final _$descricao_modeloAtom =
      Atom(name: '_CadastroVeiculoController.descricao_modelo');

  @override
  String get descricao_modelo {
    _$descricao_modeloAtom.reportRead();
    return super.descricao_modelo;
  }

  @override
  set descricao_modelo(String value) {
    _$descricao_modeloAtom.reportWrite(value, super.descricao_modelo, () {
      super.descricao_modelo = value;
    });
  }

  final _$codigo_modeloAtom =
      Atom(name: '_CadastroVeiculoController.codigo_modelo');

  @override
  String get codigo_modelo {
    _$codigo_modeloAtom.reportRead();
    return super.codigo_modelo;
  }

  @override
  set codigo_modelo(String value) {
    _$codigo_modeloAtom.reportWrite(value, super.codigo_modelo, () {
      super.codigo_modelo = value;
    });
  }

  final _$listPessoasAtom =
      Atom(name: '_CadastroVeiculoController.listPessoas');

  @override
  ObservableList<Pessoa> get listPessoas {
    _$listPessoasAtom.reportRead();
    return super.listPessoas;
  }

  @override
  set listPessoas(ObservableList<Pessoa> value) {
    _$listPessoasAtom.reportWrite(value, super.listPessoas, () {
      super.listPessoas = value;
    });
  }

  final _$listModelosAtom =
      Atom(name: '_CadastroVeiculoController.listModelos');

  @override
  ObservableList<Modelo> get listModelos {
    _$listModelosAtom.reportRead();
    return super.listModelos;
  }

  @override
  set listModelos(ObservableList<Modelo> value) {
    _$listModelosAtom.reportWrite(value, super.listModelos, () {
      super.listModelos = value;
    });
  }

  final _$selectedRadioAtom =
      Atom(name: '_CadastroVeiculoController.selectedRadio');

  @override
  int get selectedRadio {
    _$selectedRadioAtom.reportRead();
    return super.selectedRadio;
  }

  @override
  set selectedRadio(int value) {
    _$selectedRadioAtom.reportWrite(value, super.selectedRadio, () {
      super.selectedRadio = value;
    });
  }

  final _$selectedItemListAtom =
      Atom(name: '_CadastroVeiculoController.selectedItemList');

  @override
  int get selectedItemList {
    _$selectedItemListAtom.reportRead();
    return super.selectedItemList;
  }

  @override
  set selectedItemList(int value) {
    _$selectedItemListAtom.reportWrite(value, super.selectedItemList, () {
      super.selectedItemList = value;
    });
  }

  final _$labelTextAtom = Atom(name: '_CadastroVeiculoController.labelText');

  @override
  String get labelText {
    _$labelTextAtom.reportRead();
    return super.labelText;
  }

  @override
  set labelText(String value) {
    _$labelTextAtom.reportWrite(value, super.labelText, () {
      super.labelText = value;
    });
  }

  final _$fazendoCadastroAtom =
      Atom(name: '_CadastroVeiculoController.fazendoCadastro');

  @override
  bool get fazendoCadastro {
    _$fazendoCadastroAtom.reportRead();
    return super.fazendoCadastro;
  }

  @override
  set fazendoCadastro(bool value) {
    _$fazendoCadastroAtom.reportWrite(value, super.fazendoCadastro, () {
      super.fazendoCadastro = value;
    });
  }

  final _$_CadastroVeiculoControllerActionController =
      ActionController(name: '_CadastroVeiculoController');

  @override
  dynamic addList(Pessoa pessoa) {
    final _$actionInfo = _$_CadastroVeiculoControllerActionController
        .startAction(name: '_CadastroVeiculoController.addList');
    try {
      return super.addList(pessoa);
    } finally {
      _$_CadastroVeiculoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic limparList() {
    final _$actionInfo = _$_CadastroVeiculoControllerActionController
        .startAction(name: '_CadastroVeiculoController.limparList');
    try {
      return super.limparList();
    } finally {
      _$_CadastroVeiculoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic salvePessoaVeiculo() {
    final _$actionInfo = _$_CadastroVeiculoControllerActionController
        .startAction(name: '_CadastroVeiculoController.salvePessoaVeiculo');
    try {
      return super.salvePessoaVeiculo();
    } finally {
      _$_CadastroVeiculoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic salveModeloVeiculo() {
    final _$actionInfo = _$_CadastroVeiculoControllerActionController
        .startAction(name: '_CadastroVeiculoController.salveModeloVeiculo');
    try {
      return super.salveModeloVeiculo();
    } finally {
      _$_CadastroVeiculoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome_pessoa: ${nome_pessoa},
codigo_pessoa: ${codigo_pessoa},
descricao_modelo: ${descricao_modelo},
codigo_modelo: ${codigo_modelo},
listPessoas: ${listPessoas},
listModelos: ${listModelos},
selectedRadio: ${selectedRadio},
selectedItemList: ${selectedItemList},
labelText: ${labelText},
fazendoCadastro: ${fazendoCadastro}
    ''';
  }
}
