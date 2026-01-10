// 首页轮播图

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fbase/viewmodels/home.dart';
import 'package:flutter/material.dart';

class Hmslider extends StatefulWidget {
  final List<BannerItem> bannerItems;
  const Hmslider({super.key, required this.bannerItems});

  @override
  _HmsliderState createState() => _HmsliderState();
}

class _HmsliderState extends State<Hmslider> {
  Widget _getSlider() {
    final width = MediaQuery.of(context).size.width;
    debugPrint("width: $width");
    return CarouselSlider(
      items: List.generate(widget.bannerItems.length, (int index) {
        return Image.network(
          widget.bannerItems[index].imgUrl!,
          fit: BoxFit.cover,
          width: width,
        );
      }),
      options: CarouselOptions(viewportFraction: 1),
    );
  }

  Widget _getSearch() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          decoration: BoxDecoration(
            // Color.fromRGBO是Flutter中创建颜色的构造函数
            // 参数说明：
            // - 0: Red(红色通道)，取值范围0-255，0表示无红色
            // - 0: Green(绿色通道)，取值范围0-255，0表示无绿色
            // - 0: Blue(蓝色通道)，取值范围0-255，0表示无蓝色
            // - 0.4: Opacity(不透明度/alpha通道)，取值范围0.0-1.0，0.4表示40%不透明
            // 综合效果：黑色(RGB均为0)半透明背景，透明度40%
            color: const Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "搜索...",
              hintStyle: TextStyle(fontSize: 16, color: Colors.white),
            ),
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getSearch()]);
  }
}
