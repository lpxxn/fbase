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
        title: "Align",
        theme: ThemeData(fontFamily: 'NotoSansSC'),
        home: Scaffold(
          appBar: AppBar(title: const Text("Align")),
          body: Container(
            color: Colors.blue,
            child: const Align(
              alignment: Alignment.center,
              // 这两个参数是缩放因子，默认值为1.0
              // 如果设置为2.0，那么图标就会放大一倍
              // 如果设置为0.5，那么图标就会缩小一倍
              // 不设置这两个参数，那么图标就不会缩放，和父容器一样大，
              // widthFactor: 2,
              // heightFactor: 2,
              child: Icon(Icons.star, size: 150, color: Colors.amber),
            ),
          ),
        ),
      ),
    );
  }
}
