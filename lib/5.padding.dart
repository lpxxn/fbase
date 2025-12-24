import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "Padding",
        theme: ThemeData(fontFamily: 'NotoSansSC'),
        home: Scaffold(
          appBar: AppBar(title: const Text("Padding")),
          body: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
            ),
            child: Padding(
              // padding: const EdgeInsets.all(20),
              // padding: const EdgeInsets.only(left: 20, top: 20), // 不同方向的padding
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: Container(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
