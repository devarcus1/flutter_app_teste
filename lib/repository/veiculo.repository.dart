import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_teste/Util/Connection.dart';
import 'package:flutter_app_teste/controller/cadastro.veiculo.controller.dart';
import 'package:flutter_app_teste/models/Modelo.dart';
import 'package:flutter_app_teste/models/pessoa.dart';
import 'package:flutter_app_teste/models/veiculo.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

class VeiculoRepository{

  Future<List<Pessoa>> requestPessoas(String textBuscar, int selectedRadio) async{
    Response response;
    ObservableList<Pessoa> listaPessoas = ObservableList<Pessoa>();

    String url = "busca_cli/select";
    if (selectedRadio == 1) url = '$url?NOME=%25$textBuscar%25';
    if (selectedRadio == 2) url = '$url?CPF=%25$textBuscar%25';
    if (selectedRadio == 3) url = '$url?CNPJ=%25$textBuscar%25';

    try {
      response = await conexao(url, true, null);

      if (response.statusCode == HttpStatus.ok) {
        response.data["47"].forEach((element) {
          listaPessoas.add(Pessoa.fromJson(element));
        });
      }

    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
      }
      toast('erro ${e.response.statusCode}');
    }

    return listaPessoas;
  }

  Future<List<Modelo>> requestModelos(String textBuscar) async{
    Response response;
    ObservableList<Modelo> listaModelos = ObservableList<Modelo>();

    String url = "busca_modelos/select";
    url = '$url?DESCRICAO=%25$textBuscar%25';

    try {
      response = await conexao(url, true, null);

      if (response.statusCode == HttpStatus.ok) {
        response.data["55"].forEach((element) {
          listaModelos.add(Modelo.fromJson(element));
        });
      }

    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
      }
      toast('erro ${e.response.statusCode}');
    }
    return listaModelos;
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
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
      }
      toast('erro ${e.response.statusCode}');
    }
    return response;
  }

  Future<bool> cadastrarVeiculo(Veiculo veiculo) async {
    bool finalizado = false;
    Response response;
    String url = "cadastro_veiculo/insert";

    Map param = {
      '54': [veiculo.toJson()]
    };

    try {
      response = await conexao(url, false, param);
      if (response.statusCode == HttpStatus.ok) {
        finalizado = true;
      }

    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
      }
      toast('erro ${e.response.statusCode}');
    }

    return finalizado;
  }

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

}