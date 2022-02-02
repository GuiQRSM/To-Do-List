import 'package:flutter/material.dart';

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  _MainFrameState createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {

  var mainColor = Color.fromARGB(224, 123, 57, 0);
  var secColor = Color.fromARGB(223, 190, 159, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            children: <Widget>[

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_rounded,
          color: Colors.white,
        ),
        backgroundColor: mainColor,
        onPressed: (){
        },
      ),
    );
  }
}
