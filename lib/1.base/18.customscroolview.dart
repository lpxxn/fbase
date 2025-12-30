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
    return MaterialApp(
      title: "CustomScrollView",
      theme: ThemeData(fontFamily: 'NotoSansSC'),
      home: Scaffold(
        appBar: AppBar(title: const Text("CustomScrollView")),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                color: Colors.blue,
                child: const Text("一堆图"),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),

            SliverPersistentHeader(
              delegate: _MySliverPersistentHeaderDelegate(),
              pinned: true, // 固定在顶部
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverList.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 0,
                  ),
                  height: 100,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "第$index项",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10, // 主轴方向间距
              crossAxisSpacing: 5, // 交叉轴方向间距
              children: List.generate(
                10,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 0,
                  ),
                  height: 100,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "第$index项",
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.red,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 30,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
            width: 100,
            color: Colors.blue,
            child: Center(
              child: Text(
                "第$index项",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => 100; // 最大高度

  @override
  double get minExtent => 50; // 最小高度

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
