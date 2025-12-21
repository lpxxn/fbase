import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyFulSidgetState());
}

// 有状态组件的生命周期
// 创建阶段的生命周期
// 1. 构造函数
// 2. createState方法
// 3. initState方法
// 4. didChangeDependencies方法
// 构建与更新阶段的生命周期
// 1. build方法
// 2. didUpdateWidget方法
// 销毁阶段的生命周期
// 1. deactivate方法
// 2. dispose方法

// setState方法
// 1. 调用setState方法
// 2. 触发build方法
// 3. 组件树重新渲染

class MyFulSidgetState extends StatefulWidget {
  const MyFulSidgetState({super.key});

  @override
  _MyFulSidgetStateState createState() {
    print("createState阶段执行");
    return _MyFulSidgetStateState();
  }
}

class _MyFulSidgetStateState extends State<MyFulSidgetState> {
  @override
  void initState() {
    // TODO: implement initState
    print("initState阶段执行");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print("didChangeDependencies阶段执行");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyFulSidgetState oldWidget) {
    // TODO: implement didUpdateWidget
    print("didUpdateWidget阶段执行");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print("deactivate阶段执行");
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("dispose阶段执行");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("build阶段执行");
    return Container(child: null);
  }
}

// 无状态组件的生命周期
// 1. 构造函数
// 2. build方法
// 3. 组件树渲染完成
// 4. 组件树销毁
// 当组件被创建或父组件发生变化时，会调用build方法重新构建组件树
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("build");
    return MaterialApp(
      title: "MyScaffold",
      theme: ThemeData(scaffoldBackgroundColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text("MyAppaBar")),
        body: Container(child: Center(child: Text("中央区域a"))),
      ),
    );
  }
}
