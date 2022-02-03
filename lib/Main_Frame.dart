import 'package:flutter/material.dart';

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  _MainFrameState createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {

  var mainColor = Color.fromARGB(224, 123, 57, 0);
  var secColor = Color.fromARGB(255, 179, 128, 0);

  List _item = [];
  _getItem() {

    for(int i = 0; i >= 20; i++){

      Map<String, dynamic> bodyItem = Map();
      bodyItem ["content"] = "teste: ${i} ";
      _item.add(bodyItem);

    }

  }

  @override
  Widget build(BuildContext context) {

    _getItem();

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
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
    itemCount: _item.length,
    itemBuilder: (context, index) {

      return ListTile(
        title: Text("${index.toString()}"),
      );

    },
    ),
      ),
      /*floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
          Icons.add_rounded,
        ),
        label: Text(
            "adicionar",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        ),
        foregroundColor: secColor,
        elevation: 15,
        backgroundColor: mainColor,
        onPressed: (){
        },
      ),*/
     ),
    );
  }
}
