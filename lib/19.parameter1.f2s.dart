import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      title: "父传子",
      theme: ThemeData(fontFamily: 'NotoSansSC'),
      home: Scaffold(
        body: Container(
          child: const Column(
            children: [MainPage(), SizedBox(height: 20), _MainStatePage()],
          ),
        ),
      ),
    ),
  );
}

// 父传子
/*
1. 子组件定义接收属性
2. 子组件在构造时接收属性值
3. 父组件传递属性给子组件
4. 有状态组件在 对外 的类 接收属性值， 对内的类通过 widget 对象获取对应属性
5. 注意子组件的属性要用final关键字定义，因为属性是由父组件传递过来的，不能在子组件内部修改
*/
class _MainStatePage extends StatefulWidget {
  const _MainStatePage({super.key});

  @override
  _MainStatePageState createState() => _MainStatePageState();
}

class _MainStatePageState extends State<_MainStatePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          Text("父组件"),
          childStatePage(message: "我是子组件传递的消息"),
        ],
      ),
    );
  }
}

class childStatePage extends StatefulWidget {
  final String? message;
  const childStatePage({super.key, this.message});

  @override
  _childStatePageState createState() => _childStatePageState();
}

class _childStatePageState extends State<childStatePage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(widget.message ?? ""));
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          Text("父组件"),
          childPage(hintText: "我是子组件"),
        ],
      ),
    );
  }
}

class childPage extends StatelessWidget {
  final String? hintText;
  const childPage({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(hintText: hintText),
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
