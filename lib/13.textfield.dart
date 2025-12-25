import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const _MainPage());
}

class _MainPage extends StatefulWidget {
  const _MainPage({super.key});

  @override
  __MainPageState createState() => __MainPageState();
}

class __MainPageState extends State<_MainPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TextField",
      theme: ThemeData(fontFamily: 'NotoSansSC'),
      home: Scaffold(
        appBar: AppBar(title: const Text("TextField")),
        body: Container(
          padding: const EdgeInsets.all(20),
          // color: Colors.grey[200],
          color: Colors.white,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                onChanged: (value) {
                  print("姓名输入框内容改变：$value");
                },
                onSubmitted: (value) {
                  print("姓名输入框提交：$value");
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20),
                  hintText: "请输入姓名",
                  fillColor: const Color.fromARGB(255, 208, 199, 199),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20),
                  hintText: "请输入密码",
                  fillColor: const Color.fromARGB(255, 208, 199, 199),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                // color: Colors.blue,
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {
                    print("点击了登录按钮");
                    print("姓名：${_nameController.text}");
                    print("密码：${_passwordController.text}");
                  },
                  child: const Text("登录"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
