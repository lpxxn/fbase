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
      title: "哈哈",
      theme: ThemeData(fontFamily: 'NotoSansSC'),
      initialRoute: "/list",
      routes: {"/list": (context) => const ListPage()},
      onGenerateRoute: (settings) {
        debugPrint(settings.toString());

        if (settings.name == "/cardList") {
          final bool isLogin = false;
          if (!isLogin) {
            return MaterialPageRoute(builder: (context) => const LoginPage());
          }
          return MaterialPageRoute(
            settings: settings,
            builder: (context) => const _CartList(),
          );
        }

        return null;
      },
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
      appBar: AppBar(title: const Text("商品列表")),
      body: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, "/cardList", arguments: {"name": "张三"});
        },
        child: const Text("加入购物车"),
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final Map<String, dynamic> args = {};

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      setState(() {
        debugPrint("initState阶段执行 _CartList");
        if (ModalRoute.of(context)?.settings.arguments != null) {
          debugPrint(ModalRoute.of(context)?.settings.arguments.toString());
          args.addAll(
            ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("购物车列表")),
      body: Center(
        child: TextButton(onPressed: () {}, child: Text("支付 ${args["name"]}")),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("登录")),
      body: Center(
        child: TextButton(onPressed: () {}, child: const Text("去登录")),
      ),
    );
  }
}
