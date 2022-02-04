import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  _MainFrameState createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {

  var mainColor = Color.fromARGB(224, 123, 57, 0);
  var secColor = Color.fromARGB(255, 179, 128, 0);

  List _item = ["Test1", "Test2", "Test3"];

  _saveFile() async {

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: secColor,
      appBar: AppBar(
        title: Text(
            "To do List",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: secColor,
        ),
        ),
        backgroundColor: mainColor,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index){

                      return ListTile(
                        title: Text(
                          "${_item[index].toString()}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: mainColor,
                          ),
                        ),
                      );

                    },
                  itemCount: _item.length,
                ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
       child: Icon(
         Icons.add
       ),
        foregroundColor: secColor,
        elevation: 15,
        backgroundColor: mainColor,
        onPressed: (){

         showDialog(context: context,
           builder: (context){

           return AlertDialog(
             backgroundColor: secColor,
             title: Text(
                 "Adicionar Tarefas",
             style: TextStyle(
               color: mainColor,
               fontSize: 22,
             ),
             ),
             content: TextField(
               style: TextStyle(
                 color: mainColor,
                 fontSize: 18,
                 fontWeight: FontWeight.w600,
               ),
               cursorColor: mainColor,
               decoration: InputDecoration(
                 label: Text(
                     "Descrição da tarefa:",
                 ),
                 labelStyle: TextStyle(
                   color: mainColor,
                   fontSize: 18,
                   fontWeight: FontWeight.w600,
                 ),
                 enabledBorder: UnderlineInputBorder(
                   borderSide: BorderSide(
                     color: mainColor,
                   ),
                 ),
                 focusedBorder: UnderlineInputBorder(
                   borderSide: BorderSide(
                     color: mainColor,
                   ),
                 ),
               ),
             ),
             actions: <Widget>[
               FlatButton(
                 color: mainColor,
                   onPressed: () => Navigator.pop(context),
                   child: Text(
                       "Cancelar",
                     style: TextStyle(
                       color: secColor,
                       fontSize: 14,
                     ),
                   ),
               ),
               FlatButton(
                 color: mainColor,
                 onPressed: () => Navigator.pop(context),
                 child: Text(
                   "Salvar",
                   style: TextStyle(
                     color: secColor,
                     fontSize: 14,
                   ),
                 ),
               ),
             ],
           );

           },
         );

        },
      ),
     );
  }
}
