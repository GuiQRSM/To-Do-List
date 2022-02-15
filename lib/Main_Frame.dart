import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  _MainFrameState createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {

  var mainColor = Color.fromARGB(224, 123, 57, 0);
  var secColor = Color.fromARGB(255, 179, 128, 0);

  List _item = [];
  Map<String, dynamic> _recentlyRemoved = Map();
  TextEditingController _contentController = TextEditingController();

  Future<File> _getFile() async {

    final dataDirectory = await getApplicationDocumentsDirectory();
    return File("${dataDirectory.path}/local.json");

  }

  _saveTask() {

    String receiverText = _contentController.text;

    //CREATE TASKS
    Map<String, dynamic> task = Map();
    task["title"] = receiverText;
    task["check"] = false;

    setState(() {
      _item.add(task);
    });


    _saveFile();
    _contentController.text= "";

  }

  _saveFile() async {

    var receiverFile = await _getFile();

    String receiveData = json.encode(_item);
    receiverFile.writeAsString(receiveData);

  }

  _readFile() async {

    try{

      final archiveFile = await _getFile();
     return archiveFile.readAsString();

    }catch(e){
      return null;
    }

  }

  @override
  void initState() {
    super.initState();

   _readFile().then(
       (receiverData){
         setState(() {
           _item = json.decode(receiverData);
         });
       }
   );

  }

  Widget _showItems(context, index) {

    final contentItem = _item[index]['title'];

    return Dismissible(
        key: Key(contentItem),
        child: CheckboxListTile(
          title: Text(
            _item[index]['title'],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: mainColor,
            ),),
          value: _item[index]['check'],
          onChanged: (bool? vlr){
            setState(() {
              _item[index]['check'] = vlr!;
            });
            _saveFile();
          },
          activeColor: mainColor,
        ),
      onDismissed: (direction){

          //RECOVERY OF REMOVED ITEMS
        _recentlyRemoved = _item[index];

          //REMOVE THE TASKS
        _item.removeAt(index);
        //_saveFile();

        //SHOW THE SNACKBAR
        final callSnack = SnackBar(
            content: Text("Tarefa deletada!"),
            backgroundColor: mainColor,
            duration: Duration(seconds: 5),
            action: SnackBarAction(
                label: "Desfazer remoção",
                onPressed: (){

                  //INSERT REMOVED ITEM IN THE LIST AGAIN
                  setState(() {
                    _item.insert(index, _recentlyRemoved);
                  });
                  _saveFile();

                },
            ),
        );

        Scaffold.of(context).showSnackBar(callSnack);

      },
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
                Icons.delete_rounded,
                color: mainColor,
            ),
          ],
        ),
      ),
      direction: DismissDirection.endToStart,
    );

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
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemBuilder: _showItems,
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
               controller: _contentController,
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
                 onPressed: (){
                   _saveTask();
                   Navigator.pop(context);
                 },
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
