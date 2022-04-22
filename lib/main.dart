import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_teste/Util/sharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference().init();
  runApp(
      MyApp()
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

bool theme;

//SharedPreference sharedPreference = SharedPreference();
  @override
  void initState() {

    theme = SharedPreference().themeLight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArcusCV',
      debugShowCheckedModeBanner: false,
      theme: theme == true ? ThemeData.light() : ThemeData.dark() ,
      darkTheme: ThemeData.dark(),
      //themeMode: theme == true ? ThemeData.light() : ThemeData.dark(),
      // ThemeData(
      //   brightness: Brightness.dark,
      //   primaryColor: Color(0xffDFE0DF),
      //   primaryColorDark: Color(0xff3D4A3E),
      //   accentColor: Color(0xffE56E27),
      // ),
      home: Login(),
      // Scaffold(
      //   appBar: AppBar(
      //     title: Text('Teste'),
      //     centerTitle: true,
      //   ),
      //   body: Container(
      //     //color: Colors.white,
      //   ),
      // bottomNavigationBar: Container(
      //   margin: const EdgeInsets.all(3.0),
      //   padding: const EdgeInsets.all(3.0),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.all(
      //         Radius.circular(5.0) //                 <--- border radius here
      //     ),
      //
      //     //color: Colors.white,
      //     image: DecorationImage(
      //         image: AssetImage('assets/imagens/button_bar.png'),
      //         fit: BoxFit.fill,
      //     ),
      //   ),
      //   child: BottomNavigationBar(
      //     backgroundColor: Colors.transparent,
      //     currentIndex: 0,
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.person),
      //           title: Text("Minha conta")
      //       ),
      //       // BottomNavigationBarItem(
      //       //     icon: Icon(Icons.shopping_basket),
      //       //     title: Text("")
      //       // ),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.favorite),
      //           title: Text("Favoritos")
      //       ),
      //     ],
      //   ),
      // ),
      //   floatingActionButton: FloatingActionButton(
      //       child: Icon(Icons.add),
      //       onPressed: () {
      //
      //         }
      //       ),
      //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // ),

    );
  }


}



