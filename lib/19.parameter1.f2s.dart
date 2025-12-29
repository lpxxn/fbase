import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      title: "父传子",
      theme: ThemeData(fontFamily: 'NotoSansSC'),
      home: const Scaffold(
        body: Column(
          children: [
            MainPage(),
            SizedBox(height: 20),
            Expanded(child: _MainStatePage()), // _MainStatePageState 组件消失的问题。
            //问题原因 ：在 main() 函数中， _MainStatePage() 组件被直接放在外层的 Column 的 children 列表中，
            //而 _MainStatePageState 内部又有一个 Column 包裹着 Expanded 。由于 Expanded 需要在父容器具有确定的约束条件时才能正确工作，
            //但外层 Column 没有给 _MainStatePage 组件足够的高度约束，导致整个组件无法正确渲染。
          ],
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
  var list = ["红烧肉", "鱼香肉丝", "青椒肉丝", "佛跳墙", "西芹肉丝"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("父组件"),
        const childStatePage(message: "我是子组件传递的消息"),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisCount: 2,
            mainAxisSpacing: 10, // 主轴方向间距
            crossAxisSpacing: 5, // 交叉轴方向间距
            // children: list.map((e) => childStatePage2(message: e)).toList(),
            children: List.generate(
              list.length,
              (index) => childStatePage2(message: list[index]),
            ),
          ),
        ),
      ],
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

class childStatePage2 extends StatefulWidget {
  final String? message;
  const childStatePage2({super.key, required String this.message});

  @override
  _childStatePageState2 createState() => _childStatePageState2();
}

class _childStatePageState2 extends State<childStatePage2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        widget.message ?? "没有数据",
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
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
