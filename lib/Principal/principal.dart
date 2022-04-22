import 'package:flutter/material.dart';
import 'package:flutter_app_teste/Principal/principal_back.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Principal extends StatelessWidget {

  final controle = PrincipalBack();

  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 30,),

                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Novo Item',
                        ),
                      ),
                    ),
                    IconButton(icon: Icon(Icons.add), onPressed: (){
                      controle.addList(_controller.text);
                      _controller.clear();
                    }),


                SizedBox(height: 50,),
                Observer(
                  builder: (context) {
                    return DropdownButton<String>(
                      value: controle.dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.red, fontSize: 18),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String data) {

                        controle.dropdownSelecionado(data);
                        // setState(() {
                        //   dropdownValue = data;
                        // });
                      },

                      items: controle.spinnerItems.map<DropdownMenuItem<String>>((
                          String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    );
                  }
                ),
                Observer(
                    builder: (context ){
                      return  Text('Selected Item = ' + controle.dropdownValue,
                          style: TextStyle
                            (fontSize: 22,
                              color: Colors.black)
                      );
                    }
                ),

                SizedBox(height: 50,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                        border: Border.all(color: Colors.blueAccent)
                    ),
                    child: Observer(
                      builder: (context) {
                        return ListView.builder(
                            itemCount: controle.spinnerItems.length,
                            itemBuilder: (context , index){
                              return Slidable(
                                actions: [
                                  IconSlideAction(
                                    caption: 'Archive',
                                    color: Colors.blue,
                                    icon: Icons.archive,
                                    onTap: () => _showSnackBar(context, 'Archive'),
                                  ),
                                  IconSlideAction(
                                    caption: 'Share',
                                    color: Colors.indigo,
                                    icon: Icons.share,
                                    onTap: () => _showSnackBar(context, 'Share'),
                                  ),
                                ],
                                child: ListTile(
                                  title: Text('${controle.spinnerItems[index]}'),
                                ),
                              );
                            }
                        );
                      }
                    )
                  ),
                ),
                SizedBox(height: 50,),
                TextButton(onPressed: (){
                  controle.incremet();
                }, child: Text('Click')),

                Observer(
                  builder: (context ){
                    return  Text('${controle.contador}');
                  }
                ),

              ],
            ),
          ),
        ),
      );
  }

  void _showSnackBar(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
