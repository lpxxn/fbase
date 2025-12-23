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
  int count = 0;
  @override
  Widget build(BuildContext context) {
    print("build阶段执行");
    return MaterialApp(
      title: "MyApp",
      theme: ThemeData(
        // 使用本地支持中文的字体
        fontFamily: 'NotoSansSC',
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("MyAppBar")),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text("中文测试：这是一段中文字符"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                TextButton(onPressed: (){
                  setState(() {
                    print("点击了减号按钮");
                    count--;
                  });
                }, child: Text("-")),
                SizedBox(width: 20),
                Text("当前计数：${count.toString()}"),
                SizedBox(width: 20),
                TextButton(onPressed: (){
                  setState(() {
                    print("点击了加号按钮");
                    count++;
                  });
                }, child: Text("+")),
              ]
            ),
            GestureDetector(
              onTap: (){
                print("点击了文本");
                setState(() {
                  print("点击了文本，更新计数");
                  count++;
                });
              },
              child: Text("点击我"),
            ),
          ]
        ))),
      );
  }
}
