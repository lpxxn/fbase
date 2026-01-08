// 首页爆款

import 'package:flutter/material.dart';

class Hmhot extends StatefulWidget {
  const Hmhot({super.key});

  @override
  _HmhotState createState() => _HmhotState();
}

class _HmhotState extends State<Hmhot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text("爆款", style: TextStyle(color: Colors.white)),
    );
  }
}
