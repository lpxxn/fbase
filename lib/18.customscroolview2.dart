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
  final PageController _pageController = PageController(initialPage: 0);

  int _currentPageIndex = 0;

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
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    color: Colors.blue,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (int index) {
                        setState(() {
                          _currentPageIndex = index;
                        });
                      },
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 0,
                          ),
                          width: 100,
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              "第$index项",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.blue,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          10,
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentPageIndex = index;
                              });
                              _pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve:
                                    Curves.ease, // 动画曲线，这里使用了 ease 曲线，使动画更加平滑
                              );
                            },
                            child: Container(
                              // margin: const EdgeInsets.symmetric(
                              // horizontal: 2,
                              // vertical: 0,
                              // ),
                              /*
                            原代码中对所有指示器圆点都应用了 margin: const EdgeInsets.only(left: 10) ，包括第一个元素。这意味着整个圆点组的左侧多了 10 像素的空白，从视觉上看似乎仍然居中，但实际上是因为 Row 容器的 mainAxisAlignment: MainAxisAlignment.center 将这个带额外左边距的整体居中了，导致整体布局向右偏移了 5 像素（10像素的一半），这在精细布局中是个问题。
                            修复方案 ：
                            增加了条件判断，只为非第一个元素设置左侧 10 像素的间距：

                            - 第一个元素使用 EdgeInsets.zero （无边距）
                            - 从第二个元素开始使用 EdgeInsets.only(left: 10)
                            这样修改后，所有圆点组成的整体不会有额外的左侧空白，真正实现了完全居中对齐，布局更加准确。
                            */
                              // margin: const EdgeInsets.only(left: 10),
                              margin: index == 0
                                  ? EdgeInsets
                                        .zero // 第一个元素左边无边距
                                  : const EdgeInsets.only(left: 10),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: _currentPageIndex == index
                                    ? Colors.red
                                    : Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Positioned(
                  //   bottom: 20,
                  //   left: 0,
                  //   right: 0,
                  //   child: Container(
                  //     color: Colors.red,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: List.generate(
                  //         10,
                  //         (index) => Container(
                  //           // margin: const EdgeInsets.symmetric(
                  //           // horizontal: 2,
                  //           // vertical: 0,
                  //           // ),
                  //           margin: index == 0
                  //               ? EdgeInsets
                  //                     .zero // 第一个元素左边无边距
                  //               : const EdgeInsets.only(left: 10),
                  //           width: 10,
                  //           height: 10,
                  //           decoration: const BoxDecoration(
                  //             color: Colors.white,
                  //             shape: BoxShape.circle,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
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
