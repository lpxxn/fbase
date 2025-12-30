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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "List",
        theme: ThemeData(fontFamily: 'NotoSansSC'),
        home: Scaffold(
          appBar: AppBar(title: const Text("List")),
          body: ListView(
            children: List.generate(100, (index) {
              return Container(
                height: 80,
                margin: const EdgeInsets.only(bottom: 3),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Text(
                  "我是第 ${index + 1} 个item",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
              // return Container(
              //   height: 80,
              //   margin: const EdgeInsets.only(bottom: 3),
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: Colors.blue,
              //     border: Border.all(color: Colors.white, width: 1),
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   alignment: Alignment.center,
              //   child: Text(
              //     "我是第 ${index + 1} 个item",
              //     style: const TextStyle(color: Colors.white, fontSize: 20),
              //   ),
              // )
            }),
          ),
        ),
      ),
    );
  }
}
