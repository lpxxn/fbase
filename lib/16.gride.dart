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
        body: GridView.count(
          // scrollDirection: Axis.horizontal,
          // childAspectRatio: 1.0, // 子项宽高比，默认值为1.0，即子项为正方形，设置为0.5时，子项为长方形
          crossAxisCount: 2,
          padding: const EdgeInsets.all(5),
          children: List.generate(
            100,
            (index) => Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(1),
              // padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                // color: Colors.primaries[index % Colors.primaries.length],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 2),
              ),
              // rand 随机颜色
              // color:
              // Colors.primaries[Random().nextInt(Colors.primaries.length)],
              // 固定的颜色
              // color: Colors.primaries[index % Colors.primaries.length],
              // width: double.infinity,
              // height: 100,
              child: Container(
                // margin: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: Colors.primaries[index % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: Colors.red, width: 2),
                ),
                alignment: Alignment.center,
                child: Text(
                  "当前$index",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
