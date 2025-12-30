import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "路由",
      theme: ThemeData(fontFamily: 'NotoSansSC'),
      home: const ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("列表")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          // return ListTile(title: Text("item $index"));
          return GestureDetector(
            onTap: () {
              debugPrint("点击了 $index");
              // Navigator.pushNamed(context, "/detail", arguments: index);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(index: index, msg: "hello"),
                ),
              );
            },
            child: Container(
              height: 100,
              color: Colors.blue,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Center(
                child: Text(
                  "item $index",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final int index;
  final String msg;
  const DetailPage({super.key, required this.index, required this.msg});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("详情")),
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("${widget.index} ${widget.msg}\n点击返回列表"),
        ),
      ),
    );
  }
}
