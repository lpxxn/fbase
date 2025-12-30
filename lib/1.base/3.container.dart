import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Container1 Property",
      theme: ThemeData(fontFamily: 'NotoSansSC'),
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(20),
          alignment: Alignment.center,
          height: 200,
          width: 200,
          // color: Colors.red,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.red, width: 3),
          ),
          transform: Matrix4.rotationZ(0.05),
          // padding: EdgeInsets.all(20),
          child: const Text(
            "hello Container",
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              backgroundColor: Colors.yellow,
            ),
          ),
        ),
      ),
    );
  }
}
