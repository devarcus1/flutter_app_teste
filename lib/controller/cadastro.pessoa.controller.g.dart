// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro.pessoa.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroPessoaController on _CadastroPessoaController, Store {
  final _$selectedRadioAtom =
      Atom(name: '_CadastroPessoaController.selectedRadio');

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

  final _$labelFormAtom = Atom(name: '_CadastroPessoaController.labelForm');

  @override
  String get labelForm {
    _$labelFormAtom.reportRead();
    return super.labelForm;
  }

  @override
  set labelForm(String value) {
    _$labelFormAtom.reportWrite(value, super.labelForm, () {
      super.labelForm = value;
    });
  }

  final _$paddingFormAtom = Atom(name: '_CadastroPessoaController.paddingForm');

  @override
  double get paddingForm {
    _$paddingFormAtom.reportRead();
    return super.paddingForm;
  }

  @override
  set paddingForm(double value) {
    _$paddingFormAtom.reportWrite(value, super.paddingForm, () {
      super.paddingForm = value;
    });
  }

  final _$fazendoCadastroAtom =
      Atom(name: '_CadastroPessoaController.fazendoCadastro');

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

  final _$listUFAtom = Atom(name: '_CadastroPessoaController.listUF');

  @override
  List<String> get listUF {
    _$listUFAtom.reportRead();
    return super.listUF;
  }

  @override
  set listUF(List<String> value) {
    _$listUFAtom.reportWrite(value, super.listUF, () {
      super.listUF = value;
    });
  }

  final _$dropDownItemSelectedAtom =
      Atom(name: '_CadastroPessoaController.dropDownItemSelected');

  @override
  String get dropDownItemSelected {
    _$dropDownItemSelectedAtom.reportRead();
    return super.dropDownItemSelected;
  }

  @override
  set dropDownItemSelected(String value) {
    _$dropDownItemSelectedAtom.reportWrite(value, super.dropDownItemSelected,
        () {
      super.dropDownItemSelected = value;
    });
  }

  @override
  String toString() {
    return '''
selectedRadio: ${selectedRadio},
labelForm: ${labelForm},
paddingForm: ${paddingForm},
fazendoCadastro: ${fazendoCadastro},
listUF: ${listUF},
dropDownItemSelected: ${dropDownItemSelected}
    ''';
  }
}
