// 首页推荐

import 'package:flutter/material.dart';

class Hmsuggestion extends StatefulWidget {
  const Hmsuggestion({super.key});

  @override
  _HmsuggestionState createState() => _HmsuggestionState();
}

class _HmsuggestionState extends State<Hmsuggestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 300,
      color: Colors.blue,
      child: const Text("推荐", style: TextStyle(color: Colors.white)),
    );
  }
}
