import 'package:flutter/material.dart';

void main() {
  runApp(MyScaffold());
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StatelessWidget",
      home: Scaffold(
        appBar: AppBar(title: Text("MyAppBar")),
        body: Container(child: Container(child: Text("中央区域"))),
        bottomNavigationBar: Container(child: Text("底部区域")),
      ),
    );
  }
}
