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
      title: "Warp",
      theme: ThemeData(fontFamily: 'NotoSansSC'),
      home: Scaffold(
        appBar: AppBar(title: const Text("Warp")),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.amber),
          child: Wrap(
            direction: Axis.horizontal,
            // 主轴方向的间距, 主轴方向是水平方向
            spacing: 10,
            // 交叉轴方向的间距, 交叉轴方向是垂直方向
            runSpacing: 10,
            alignment: WrapAlignment.spaceEvenly,
            children: getList(),
          ),
        ),
      ),
    );
  }
}
