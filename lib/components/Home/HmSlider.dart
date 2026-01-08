// 首页轮播图

import 'package:flutter/material.dart';

class Hmslider extends StatefulWidget {
  const Hmslider({super.key});

  @override
  _HmsliderState createState() => _HmsliderState();
}

class _HmsliderState extends State<Hmslider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 300,
        color: Colors.blue,
        alignment: Alignment.center,
        child: const Text(
          "轮播图",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
