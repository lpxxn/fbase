import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flex",
      theme: ThemeData(fontFamily: 'NotoSansSC'),
      home: Scaffold(
        appBar: AppBar(title: const Text("Flex")),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.amber),
          child: Column(
            children: [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.red,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    //  tight 会强制占用空间，不会被压缩
                    //  loose 会根据空间大小压缩
                    fit: FlexFit.tight,
                    flex: 2,
                    child: Container(
                      color: Colors.red,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ],
              ),
              // 使用 Expanded 来占用剩余空间，而不是 SizedBox(height: double.infinity)
              // 在当前代码中， Flex widget 嵌套在 Column 里，外层 Column 的 SizedBox 使用 height: double.infinity 导致了布局约束冲突
              Expanded(
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(color: Colors.black, width: 20),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(color: Colors.green, width: 20),
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
