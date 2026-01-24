// 首页更多列表

import 'package:flutter/material.dart';

class HmMoretList extends StatefulWidget {
  final List<dynamic> recommendList;

  const HmMoretList({super.key, required this.recommendList});

  @override
  _HmMoretListState createState() => _HmMoretListState();
}

class _HmMoretListState extends State<HmMoretList> {
  @override
  Widget build(BuildContext context) {
    // if (widget.recommendList.isEmpty) {
    //   return const SliverToBoxAdapter(child: SizedBox.shrink());
    // }
    return SliverGrid.builder(
      itemCount: widget.recommendList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.blue,
          alignment: Alignment.center,
          // child: Text("商品$index", style: const TextStyle(color: Colors.white)),
          child: _getChildren(index),
        );
      },
    );
  }

  Widget _getChildren(int index) {
    return Container(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(widget.recommendList[index].picture ?? ""),
          ),
        ],
      ),
    );
  }
}
