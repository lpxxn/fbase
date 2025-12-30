import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPagState createState() => _MainPagState();
}

class _MainPagState extends State<MainPage> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SingleScrollView",
      theme: ThemeData(
        // 使用本地支持中文的字体
        fontFamily: 'NotoSansSC',
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("SingleScrollView")),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: List.generate(100, (index) {
                  return Container(
                    height: 80,
                    margin: const EdgeInsets.only(bottom: 3),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "我是第 ${index + 1} 个item",
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "去顶部",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  print("点击了底部按钮");
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                child: Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "去底部",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
