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
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello 你好~~",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                ),
              ),
              Text(
                "今天天气真好今天天气真好今天天气真好今天天气真好今天天气真好今天天气真好今天天气真好今天天气真好今天天气真好今天天气真好",
                style: TextStyle(color: Colors.green, fontSize: 30),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text.rich(
                TextSpan(
                  text: "你好",
                  style: TextStyle(color: Colors.red, fontSize: 30),
                  children: [
                    TextSpan(
                      text: "你好",
                      style: TextStyle(color: Colors.green, fontSize: 30),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
