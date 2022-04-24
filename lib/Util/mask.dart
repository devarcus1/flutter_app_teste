

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ExampleMask {

  final MaskTextInputFormatter formatter;
  final FormFieldValidator<String> validator;
  final String hint;
  final TextInputType textInputType;
  final bool upperCase;
  final int lenghtField;
  final bool useMask;
  final bool permiteEspaco;

  ExampleMask(
      {this.upperCase,
        this.formatter,
        this.validator,
        this.hint,
        this.textInputType,
        this.lenghtField,
        this.useMask,
        this.permiteEspaco});

  // ExampleMask example = ExampleMask(
  //     formatter: MaskTextInputFormatter(filter: {"#": RegExp(r'[A-Za-z0-9]')}),
  //     upperCase: false,
  //     textInputType: TextInputType.text,
  //     lenghtField: 60,
  //     useMask: false);
  // final ExampleMask examplePLACA = ExampleMask(
  //     formatter: MaskTextInputFormatter(
  //         mask: "#######", filter: {"#": RegExp(r'[A-Za-z0-9]')}),
  //     upperCase: true,
  //     textInputType: TextInputType.text,
  //     lenghtField: 7,
  //     useMask: true);
  // final ExampleMask exampleUFPLACA = ExampleMask(
  //     formatter: MaskTextInputFormatter(
  //         mask: '##', filter: {"#": RegExp(r'[A-Za-z0-9]')}),
  //     upperCase: true,
  //     textInputType: TextInputType.text,
  //     lenghtField: 2,
  //     useMask: true);
  // final ExampleMask exampleCHASSI = ExampleMask(
  //     formatter: MaskTextInputFormatter(
  //         mask: '#################', filter: {"#": RegExp(r'[A-Za-z0-9]')}),
  //     upperCase: true,
  //     textInputType: TextInputType.text,
  //     lenghtField: 17,
  //     useMask: true);
  // final ExampleMask exampleANO = ExampleMask(
  //     formatter: MaskTextInputFormatter(
  //         mask: '##/##', filter: {"#": RegExp(r'[0-9]')}),
  //     upperCase: true,
  //     textInputType: TextInputType.number,
  //     lenghtField: 5,
  //     useMask: true);
  // final ExampleMask exampleKM = ExampleMask(
  //     formatter: MaskTextInputFormatter(
  //         mask: '#########', filter: {"#": RegExp(r'[0-9]')}),
  //     upperCase: true,
  //     textInputType: TextInputType.number,
  //     lenghtField: 9,
  //     useMask: true);

  //
  // final ExampleMask exampleNumbers = ExampleMask(
  //     formatter: MaskTextInputFormatter(filter: {"#": RegExp(r'[0-9]')}),
  //     upperCase: false,
  //     textInputType: TextInputType.number,
  //     lenghtField: 20,
  //     useMask: false);
  // final ExampleMask exampleTelefone = ExampleMask(
  //     formatter: MaskTextInputFormatter(
  //         mask: "(##)#########", filter: {"#": RegExp(r'[0-9]')}),
  //     upperCase: true,
  //     textInputType: TextInputType.number,
  //     lenghtField: 20,
  //     useMask: true);
  // final ExampleMask exampleEmail = ExampleMask(
  //     formatter: MaskTextInputFormatter(filter: {"#": RegExp(r'[A-Za-z0-9]')}),
  //     upperCase: false,
  //     textInputType: TextInputType.emailAddress,
  //     lenghtField: 60,
  //     useMask: false);
  // final ExampleMask exampleCpf = ExampleMask(
  //     formatter: MaskTextInputFormatter(
  //         mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')}),
  //     upperCase: true,
  //     textInputType: TextInputType.number,
  //     lenghtField: 15,
  //     useMask: true);
  // final ExampleMask exampleCnpj = ExampleMask(
  //     formatter: MaskTextInputFormatter(
  //         mask: "##.###.###/####-##", filter: {"#": RegExp(r'[0-9]')}),
  //     upperCase: true,
  //     lenghtField: 20,
  //     textInputType: TextInputType.number,
  //     useMask: true);
  // final ExampleMask exampleCEP = ExampleMask(
  //     formatter: MaskTextInputFormatter(
  //         mask: "##.###.###", filter: {"#": RegExp(r'[0-9]')}),
  //     upperCase: true,
  //     textInputType: TextInputType.number,
  //     lenghtField: 10,
  //     useMask: true);
  // final ExampleMask exampleUF = ExampleMask(
  //     formatter: MaskTextInputFormatter(
  //         mask: "##", filter: {"#": RegExp(r'[A-Za-z]')}),
  //     upperCase: true,
  //     textInputType: TextInputType.text,
  //     lenghtField: 2,
  //     useMask: true);





}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}