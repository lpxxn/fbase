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
  final List<String> list = ["红色", "绿色", "蓝色", "黄色", "紫色", "橙色"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "父传子",
      theme: ThemeData(fontFamily: 'NotoSansSC'),
      home: Scaffold(
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          padding: const EdgeInsets.all(10),
          children: list
              .map(
                (e) => childPage(
                  msg: e,
                  index: list.indexOf(e),
                  delItemFunc: delItem,
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void delItem(int index) {
    setState(() {
      list.removeAt(index);
    });
  }
}

// 子传父
/*
1. 父组件传递一个函数给子组件 ️
2. 子组件调用该函数
3. 父组件通过回调函数获取参数
*/

class childPage extends StatefulWidget {
  final String msg;
  final int index;
  Function(int index) delItemFunc;
  childPage({
    super.key,
    required this.msg,
    required this.index,
    required this.delItemFunc,
  });

  @override
  _childPageState createState() => _childPageState();
}

class _childPageState extends State<childPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              widget.msg,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              color: Colors.red,
              icon: const Icon(Icons.delete),
              onPressed: () {
                widget.delItemFunc(widget.index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
