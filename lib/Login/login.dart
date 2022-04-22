
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_teste/Util/sharedPreference.dart';
import 'package:flutter_app_teste/cadastros/Cadastros.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> with TickerProviderStateMixin{

  bool theme_claro;

  @override
  void initState() {
    theme_claro = SharedPreference().themeLight;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    final darkTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      accentColor: Colors.white,
      accentIconTheme: IconThemeData(color: Colors.black),
      dividerColor: Colors.black12,
    );

    final lightTheme = ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Color(0xffFF4A18),
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      accentColor: Colors.black,
      accentIconTheme: IconThemeData(color: Colors.white),
      dividerColor: Colors.white54,
    );

    return MaterialApp(
      title: 'ArcusCV',
      debugShowCheckedModeBanner: false,
      theme: theme_claro == true ? lightTheme : darkTheme, //ThemeData.light() : ThemeData.dark() ,
      //darkTheme: ThemeData.dark(),
      home: Scaffold(
        //backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [


                  SafeArea(
                    child: Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: AnimatedIcon(
                          // theme_claro == true ? Icons.wb_sunny : CupertinoIcons.moon,
                          icon: AnimatedIcons.pause_play,

                          progress: AnimationController(
                            vsync: this,
                            duration: Duration(milliseconds: 400),
                            reverseDuration: Duration(milliseconds: 400),
                          ),
                        ),
                        onPressed: (){
                          SharedPreference().themeLight = !theme_claro;
                          setState(() {
                            theme_claro = SharedPreference().themeLight;
                          });

                        },
                      ),
                    ),
                  ),

                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      //color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                        alignment: Alignment.center,
                        image: AssetImage('assets/imagens/logo_arcus.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 100,),
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Usuário",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      ),
                      validator: (val) {
                        if(val.length == 0) {
                          return "Campo de usuário não pode estar vazio!";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Senha",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                      ),
                      validator: (val) {
                        if(val.length == 0) {
                          return "Campo de senha não pode estar vazio!";
                        }else{
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),

                  TextButton(
                      onPressed: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => Teste_slidable()));
                        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => Principal()));
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => Cadastros()));
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.grey)
                              )
                          )
                      ),
                      child: Container(
                        width: 100,
                        //padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(25.0),
                        ),
                        child: Center(
                          child: Text('Entrar',
                            style: TextStyle(
                                //color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                  ),


                ],
              ),
            ),
          ),
        ),
    );

  }
}
