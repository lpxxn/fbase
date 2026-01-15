// 首页推荐

import 'package:flutter/material.dart';

class Hmsuggestion extends StatefulWidget {
  const Hmsuggestion({super.key});

  @override
  _HmsuggestionState createState() => _HmsuggestionState();
}

class _HmsuggestionState extends State<Hmsuggestion> {
  Widget _buildHeader() {
    return const Row(
      children: [
        Text(
          "特惠推荐",
          style: TextStyle(
            color: Color.fromARGB(255, 94, 35, 30),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "精选省攻略",
          style: TextStyle(
            color: Color.fromARGB(255, 94, 35, 30),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget buildLeft() {
    return Container(
      width: 100,
      height: 100,
      color: Colors.red,
      child: Image.asset("lib/asset/images/home_cmd_inner.png"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 300,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage("lib/asset/images/home_cmd_sm.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(children: [_buildHeader()]),
    );
  }
}
