import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GrideView",
      theme: ThemeData(fontFamily: 'NotoSansSC'),
      home: Scaffold(
        appBar: AppBar(title: const Text("GrideView")),
        body: GridView.extent(
          maxCrossAxisExtent: 200, // 每个item的宽度,会根据屏幕宽度自动调整，每个item的高度会根据屏幕高度自动调整
          children: List.generate(100, (index) {
            return Container(
              height: 80,
              width: double.infinity,
              alignment: Alignment.center,
              // margin: const EdgeInsets.only(bottom: 3),
              decoration: BoxDecoration(
                color: Colors.primaries[index % Colors.primaries.length],
                borderRadius: BorderRadius.circular(5),
                // border 只想有左边和下边
                border: const Border(
                  left: BorderSide(color: Colors.white, width: 1),
                  // bottom: BorderSide(color: Colors.white, width: 1),
                ),
              ),
              child: Text(
                "我是第 ${index + 1} 个item",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          }),
        ),
      ),
    );
  }
}
