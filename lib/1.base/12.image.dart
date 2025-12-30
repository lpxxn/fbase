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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("lib/asset/images/1.jpg"),
              Image.asset(
                "lib/asset/images/2.jpeg",
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ],
            // children: [Image.asset("lib/asset/images/pdxjr.jpeg")],
          ),
        ),
      ),
    );
  }
}
