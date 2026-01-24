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
        childAspectRatio: 0.7,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Container(
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
          // Expanded(
          // child: ClipRRect(
          ClipRRect(
            borderRadius: BorderRadius.circular(8),

            child: AspectRatio(
              aspectRatio: 1.0,
              child: Image.network(
                widget.recommendList[index].picture ?? "",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "lib/asset/images/1.jpg",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          // ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              widget.recommendList[index].name ?? "",
              maxLines: 2,
              style: const TextStyle(fontSize: 20, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "¥${widget.recommendList[index].price ?? ""}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                    ),
                    children: [
                      const TextSpan(text: "  "),
                      TextSpan(
                        text: "${widget.recommendList[index].price ?? ""}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${widget.recommendList[index].payCount ?? "0"}人付款",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
