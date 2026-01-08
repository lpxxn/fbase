// 首页更多列表

import 'package:flutter/material.dart';

class HmMoretList extends StatefulWidget {
  const HmMoretList({super.key});

  @override
  _HmMoretListState createState() => _HmMoretListState();
}

class _HmMoretListState extends State<HmMoretList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text("商品$index", style: const TextStyle(color: Colors.white)),
        );
      },
    );
  }
}
