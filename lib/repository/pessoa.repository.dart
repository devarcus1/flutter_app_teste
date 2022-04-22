
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_teste/Util/Connection.dart';
import 'package:flutter_app_teste/models/endereco.dart';
import 'package:flutter_app_teste/models/pessoa.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PessoaRepository{



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

  Future<Pessoa> cadastrarPessoa(Pessoa pessoa) async{
    Response response;
    String url = "cadastro_pessoa/insert";
    Pessoa pessoaResponse = Pessoa();

    Map param = {
      '56': [pessoa.toJson()]
    };

      response = await conexao(url, false, param);
      if (response.statusCode == HttpStatus.ok) {
        List<Pessoa> list = List<Pessoa>();
        response.data["56"].forEach((element) {
          list.add(Pessoa.fromJson(element));
        });
        pessoaResponse = list.first;
      }

    return pessoaResponse;
  }


  Future<bool> cadastrarEndereco(Endereco endereco) async{
    bool finalizado = false;
    Response response;
    String url = "cadastro_endereco/insert";

    Map param = {
      '57': [endereco.toJson()]
    };

    response = await conexao(url, false, param);
    if (response.statusCode == HttpStatus.ok) {
      finalizado = true;
    }

    return finalizado;
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


}