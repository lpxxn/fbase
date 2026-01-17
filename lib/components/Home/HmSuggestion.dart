// 首页推荐

import 'package:fbase/viewmodels/home.dart';
import 'package:flutter/material.dart';

class Hmsuggestion extends StatefulWidget {
  final SpecialRecommendSection specialRecommendSection;

  const Hmsuggestion({super.key, required this.specialRecommendSection});

  @override
  _HmsuggestionState createState() => _HmsuggestionState();
}

class _HmsuggestionState extends State<Hmsuggestion> {
  List<GoodsItem> _getDisplayItems() {
    if ((widget.specialRecommendSection.subTypes?.isEmpty ?? true) == true) {
      return [];
    }
    return widget.specialRecommendSection.subTypes!.first.goodsItems!.items
            ?.take(3)
            .toList() ??
        [];
  }

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

  Widget _buildLeft() {
    return Container(
      width: 100,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.red,
        image: const DecorationImage(
          image: AssetImage("lib/asset/images/home_cmd_inner.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  List<Widget> _getChildrenList() {
    final List<GoodsItem> list = _getDisplayItems();
    return List.generate(list.length, (index) {
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              list[index].picture ?? "",
              width: 100,
              height: 140,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 96, 12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "¥${list[index].price?.toString() ?? ""}",
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        alignment: Alignment.center,
        // height: 300,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
            image: AssetImage("lib/asset/images/home_cmd_sm.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            _buildHeader(),
            Row(
              children: [
                _buildLeft(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _getChildrenList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
