import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_teste/CadastroVeiculo/CadastroVeiculo.dart';
import 'package:flutter_app_teste/cadastroAgendamento/CadastroAgendamento.dart';
import 'package:flutter_app_teste/cadastroPessoa/CadastroPessoa.dart';

class Cadastros extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext) => CadastroPessoa()));
                },
                child: Text('Cadastrar Pessoa')),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext) => CadastroVeiculo()));
                },
                child: Text('Cadastrar Veiculo')
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext) => CadastroAgendamento()));
                },
                child: Text('Cadastrar Agendamento')),

          ],
        ),
      ),
    );
  }
}
