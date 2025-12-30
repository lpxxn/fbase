import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "Row",
        theme: ThemeData(fontFamily: 'NotoSansSC'),
        home: Scaffold(
          appBar: AppBar(title: const Text("Row")),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: Colors.amber),
            child: Row(
              // MainAxisAlignment.start: 默认值，子项会对齐到父容器的顶部
              // MainAxisAlignment.end: 子项会对齐到父容器的底部
              // MainAxisAlignment.center: 子项会对齐到父容器的中心
              // MainAxisAlignment.spaceAround: 每个子项之间的间距相等，且子项与父容器的间距也相等
              // MainAxisAlignment.spaceBetween: 每个子项之间的间距相等，且第一个子项与父容器的间距为0，最后一个子项与父容器的间距也为0
              // MainAxisAlignment.spaceEvenly: 每个子项之间的间距相等，且每个子项与父容器的间距也相等, 他与spaceAround的区别是，spaceEvenly会将第一个子项与父容器的间距也相等
              mainAxisAlignment: MainAxisAlignment.center,

              // CrossAxisAlignment.start: 默认值，子项会对齐到父容器的左侧
              // CrossAxisAlignment.end: 子项会对齐到父容器的右侧
              // CrossAxisAlignment.center: 子项会对齐到父容器的中心
              // CrossAxisAlignment.stretch: 子项会拉伸到父容器的高度, 这样做后子项的 height 就会被拉伸到父容器的高度
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(width: 100, height: 100, color: Colors.red),
                // const SizedBox(height: 20, width: 20),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
