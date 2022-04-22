// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro.agendamento.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroAgendamentoController on _CadastroAgendamentoController, Store {
  final _$agendamentoAtom =
      Atom(name: '_CadastroAgendamentoController.agendamento');

  @override
  Agendamento get agendamento {
    _$agendamentoAtom.reportRead();
    return super.agendamento;
  }

  @override
  set agendamento(Agendamento value) {
    _$agendamentoAtom.reportWrite(value, super.agendamento, () {
      super.agendamento = value;
    });
  }

  final _$listPessoasAtom =
      Atom(name: '_CadastroAgendamentoController.listPessoas');

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

  final _$listVeiculosAtom =
      Atom(name: '_CadastroAgendamentoController.listVeiculos');

  @override
  ObservableList<Veiculo> get listVeiculos {
    _$listVeiculosAtom.reportRead();
    return super.listVeiculos;
  }

  @override
  set listVeiculos(ObservableList<Veiculo> value) {
    _$listVeiculosAtom.reportWrite(value, super.listVeiculos, () {
      super.listVeiculos = value;
    });
  }

  final _$listEmpresasAtom =
      Atom(name: '_CadastroAgendamentoController.listEmpresas');

  @override
  ObservableList<Empresa> get listEmpresas {
    _$listEmpresasAtom.reportRead();
    return super.listEmpresas;
  }

  @override
  set listEmpresas(ObservableList<Empresa> value) {
    _$listEmpresasAtom.reportWrite(value, super.listEmpresas, () {
      super.listEmpresas = value;
    });
  }

  final _$listConsultoresAtom =
      Atom(name: '_CadastroAgendamentoController.listConsultores');

  @override
  ObservableList<Pessoa> get listConsultores {
    _$listConsultoresAtom.reportRead();
    return super.listConsultores;
  }

  @override
  set listConsultores(ObservableList<Pessoa> value) {
    _$listConsultoresAtom.reportWrite(value, super.listConsultores, () {
      super.listConsultores = value;
    });
  }

  final _$selectedRadioAtom =
      Atom(name: '_CadastroAgendamentoController.selectedRadio');

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
      Atom(name: '_CadastroAgendamentoController.selectedItemList');

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

  final _$labelTextAtom =
      Atom(name: '_CadastroAgendamentoController.labelText');

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

  final _$_CadastroAgendamentoControllerActionController =
      ActionController(name: '_CadastroAgendamentoController');

  @override
  dynamic limparList() {
    final _$actionInfo = _$_CadastroAgendamentoControllerActionController
        .startAction(name: '_CadastroAgendamentoController.limparList');
    try {
      return super.limparList();
    } finally {
      _$_CadastroAgendamentoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
agendamento: ${agendamento},
listPessoas: ${listPessoas},
listVeiculos: ${listVeiculos},
listEmpresas: ${listEmpresas},
listConsultores: ${listConsultores},
selectedRadio: ${selectedRadio},
selectedItemList: ${selectedItemList},
labelText: ${labelText}
    ''';
  }
}
