import 'package:flutter/material.dart';

class MainFrame extends StatefulWidget {
  const MainFrame({Key? key}) : super(key: key);

  @override
  _MainFrameState createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {

  var mainColor = Color.fromARGB(224, 123, 57, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "To do List",
        style: TextStyle(
          fontWeight: FontWeight.w700,
        ),
        ),
        backgroundColor: mainColor,
      ),
    );
  }
}
