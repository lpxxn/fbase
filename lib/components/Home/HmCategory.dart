// 首页分类

import 'package:flutter/material.dart';

class Hmcategory extends StatefulWidget {
  const Hmcategory({super.key});

  @override
  _HmcategoryState createState() => _HmcategoryState();
}

class _HmcategoryState extends State<Hmcategory> {
  @override
  Widget build(BuildContext context) {
    // 返回一一个点横向滚动的组件
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            width: 80,
            height: 100,
            color: Colors.blue,
            margin: index == 0
                ? EdgeInsets.zero
                : const EdgeInsets.only(left: 10),
            child: Text(
              "分类$index",
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
