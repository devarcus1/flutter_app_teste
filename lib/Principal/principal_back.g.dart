// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'principal_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PrincipalBack on _PrincipalBack, Store {
  final _$contadorAtom = Atom(name: '_PrincipalBack.contador');

  @override
  int get contador {
    _$contadorAtom.reportRead();
    return super.contador;
  }

  @override
  set contador(int value) {
    _$contadorAtom.reportWrite(value, super.contador, () {
      super.contador = value;
    });
  }

  final _$dropdownValueAtom = Atom(name: '_PrincipalBack.dropdownValue');

  @override
  String get dropdownValue {
    _$dropdownValueAtom.reportRead();
    return super.dropdownValue;
  }

  @override
  set dropdownValue(String value) {
    _$dropdownValueAtom.reportWrite(value, super.dropdownValue, () {
      super.dropdownValue = value;
    });
  }

  final _$spinnerItemsAtom = Atom(name: '_PrincipalBack.spinnerItems');

  @override
  List<String> get spinnerItems {
    _$spinnerItemsAtom.reportRead();
    return super.spinnerItems;
  }

  @override
  set spinnerItems(List<String> value) {
    _$spinnerItemsAtom.reportWrite(value, super.spinnerItems, () {
      super.spinnerItems = value;
    });
  }

  final _$_PrincipalBackActionController =
      ActionController(name: '_PrincipalBack');

  @override
  dynamic addList(String item) {
    final _$actionInfo = _$_PrincipalBackActionController.startAction(
        name: '_PrincipalBack.addList');
    try {
      return super.addList(item);
    } finally {
      _$_PrincipalBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic incremet() {
    final _$actionInfo = _$_PrincipalBackActionController.startAction(
        name: '_PrincipalBack.incremet');
    try {
      return super.incremet();
    } finally {
      _$_PrincipalBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dropdownSelecionado(String value) {
    final _$actionInfo = _$_PrincipalBackActionController.startAction(
        name: '_PrincipalBack.dropdownSelecionado');
    try {
      return super.dropdownSelecionado(value);
    } finally {
      _$_PrincipalBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contador: ${contador},
dropdownValue: ${dropdownValue},
spinnerItems: ${spinnerItems}
    ''';
  }
}
