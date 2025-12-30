import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  List<Container> getList() {
    return List.generate(
      10,
      (index) =>
          Container(color: Colors.primaries[index], width: 100, height: 100),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stack",
      theme: ThemeData(fontFamily: 'NotoSansSC'),
      home: Scaffold(
        appBar: AppBar(title: const Text("Stack")),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.amber,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 200,
                child: Container(width: 50, height: 50, color: Colors.yellow),
              ),
              Container(width: 300, height: 300, color: Colors.blue),
              Positioned(
                top: 10,
                left: 10,
                child: Container(width: 200, height: 200, color: Colors.red),
              ),
              Positioned(
                right: 20,
                bottom: 20,
                child: Container(width: 100, height: 100, color: Colors.green),
              ),
            ],
            // alignment: Alignment.center,
            // children: [
            //   Container(width: 300, height: 300, color: Colors.blue),
            //   Container(width: 200, height: 200, color: Colors.red),
            //   Container(width: 100, height: 100, color: Colors.green),
            //   Container(width: 50, height: 50, color: Colors.yellow),
            // ],
          ),
        ),
      ),
    );
  }
}
