import 'package:flutter/material.dart';

// void main() {
//   runApp(MainPage());
// }

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return _MainPageState();
//   }
// }

// // 内部，负责管理数据 处理业务逻辑 渲染UI
// class _MainPageState extends State<MainPage> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "MyScaffold",
//       home: Scaffold(
//         appBar: AppBar(title: Text("MyAppBar")),
//         body: Container(
//           child: Container(child: Center(child: Text("中央区域"))),
//         ),
//       ),
//     );
//   }
// }

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "StatelessWidget",
      home: Scaffold(
        appBar: AppBar(title: Text("MyAppBar")),
        body: Container(child: Container(child: Text("中央区域"))),
        bottomNavigationBar: Container(child: Text("底部区域")),
      ),
    );
  }
}
