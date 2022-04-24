
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_teste/Util/Connection.dart';
import 'package:flutter_app_teste/models/agendamento.dart';
import 'package:flutter_app_teste/models/empresa.dart';
import 'package:flutter_app_teste/models/endereco.dart';
import 'package:flutter_app_teste/models/pessoa.dart';
import 'package:flutter_app_teste/models/veiculo.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

class AgendamentoRepository{



  toast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }



  Future<Response> conexao(String url, bool isGet, Map map) async{
    Dio _dio;
    Response response;
    try {
      _dio = Connection.returnDio();
      if(isGet)
        response = await _dio.get(url);
      else
        response = await _dio.post(url, data: map);

    } on DioError catch (e) {
      print(e.message);
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
      }
      toast('erro ${e.response.statusCode}');
    }
    return response;
  }

  Future<List<Pessoa>> requestPessoas(String textBuscar, int selectedRadio) async{
    Response response;
    ObservableList<Pessoa> listaPessoas = ObservableList<Pessoa>();

    String url = "busca_cli/select";
    if (selectedRadio == 1) url = '$url?NOME=%25$textBuscar%25';
    if (selectedRadio == 2) url = '$url?CPF=%25$textBuscar%25';
    if (selectedRadio == 3) url = '$url?CNPJ=%25$textBuscar%25';

    response = await conexao(url, true, null);

    if (response.statusCode == HttpStatus.ok) {
      response.data["47"].forEach((element) {
        listaPessoas.add(Pessoa.fromJson(element));
      });
    }

    return listaPessoas;
  }

  Future<List<Veiculo>> requestVeiculos(String textBuscar, int selectedRadio) async{
    Response response;
    ObservableList<Veiculo> listaVeiculos = ObservableList<Veiculo>();

    String url = "busca_veiculos/select";
    if (selectedRadio == 1) url = '$url?PLACA=%25$textBuscar%25';
    if (selectedRadio == 2) url = '$url?CPF=%25$textBuscar%25';
    if (selectedRadio == 3) url = '$url?CNPJ=%25$textBuscar%25';

    response = await conexao(url, true, null);

    if (response.statusCode == HttpStatus.ok) {
      response.data["58"].forEach((element) {
        listaVeiculos.add(Veiculo.fromJson(element));
      });
    }

    return listaVeiculos;
  }

  Future<List<Empresa>> requestEmpresas(String textBuscar, int selectedRadio) async{
    Response response;
    ObservableList<Empresa> listaEmpresas = ObservableList<Empresa>();

    String url = "busca_empresas/select";
    if (selectedRadio == 1) url = '$url?NOME=%25$textBuscar%25';
    if (selectedRadio == 2) url = '$url?CNPJ=%25$textBuscar%25';

    response = await conexao(url, true, null);

    if (response.statusCode == HttpStatus.ok) {
      response.data["59"].forEach((element) {
        listaEmpresas.add(Empresa.fromJson(element));
      });
    }

    return listaEmpresas;
  }

  Future<List<Pessoa>> requestConsultores(String textBuscar, int selectedRadio) async{
    Response response;
    ObservableList<Pessoa> listaConsultores = ObservableList<Pessoa>();

    String url = "busca_consultor/select";
    if (selectedRadio == 1) url = '$url?NOME=%25$textBuscar%25';
    if (selectedRadio == 2) url = '$url?CPF=%25$textBuscar%25';
    if (selectedRadio == 3) url = '$url?CNPJ=%25$textBuscar%25';

    response = await conexao(url, true, null);

    if (response.statusCode == HttpStatus.ok) {
      response.data["60"].forEach((element) {
        listaConsultores.add(Pessoa.fromJson(element));
      });
    }

    return listaConsultores;
  }

  Future<bool> cadastrarAgendamento(Agendamento agendamento) async{
    Response response;
    String url = "cadastro_agendamento/insert";

    Map param = {
      '61': [agendamento.toJson()]
    };

    response = await conexao(url, false, param);
    if (response.statusCode == HttpStatus.ok) {
      return true;
    }else
      return false;
  }


}