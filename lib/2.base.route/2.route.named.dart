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
      initialRoute: "/list",
      routes: {
        "/list": (context) => const ListPage(),
        "/detail": (context) => DetailPage(),
      },
      // onGenerateRoute: (settings) {
      //   if (settings.name == "/detail") {
      //     // 从settings中获取参数
      //     final args = settings.arguments as Map<String, dynamic>? ?? {};
      //     return MaterialPageRoute(
      //       builder: (context) =>
      //           DetailPage(index: args["index"] ?? 0, msg: args["msg"] ?? ""),
      //     );
      //   }
      //   // 默认路由
      //   return MaterialPageRoute(builder: (context) => const ListPage());
      // },
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
              Navigator.pushNamed(
                context,
                "/detail",
                arguments: {"index": index, "msg": "hello"},
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
  DetailPage({super.key});
  int index = 0;
  String msg = "";

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    // TODO: implement initState

    // 这样会报错
    // final args =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ??
    //     {};
    // 要在微任务中获取参数，不加微任务会报错，因为在build方法中获取参数时，路由还没有完全构建完成
    Future.microtask(() {
      if (ModalRoute.of(context) != null) {
        final args =
            ModalRoute.of(context)?.settings.arguments
                as Map<String, dynamic>? ??
            {};
        debugPrint("args is $args");
        widget.index = args["index"] ?? 0;
        widget.msg = args["msg"] ?? "";
        setState(() {});
      } else {
        debugPrint("args is null");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("详情")),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/list");
            },
            child: Text("${widget.index} ${widget.msg}\n点击返回列表"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("${widget.index} ${widget.msg}\n点击返回列表"),
          ),
        ],
      ),
    );
  }
}
