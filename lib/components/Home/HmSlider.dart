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
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  Widget _getSlider() {
    final width = MediaQuery.of(context).size.width;
    debugPrint("width: $width");
    return CarouselSlider(
      carouselController: _carouselController,
      items: List.generate(widget.bannerItems.length, (int index) {
        return Image.network(
          widget.bannerItems[index].imgUrl!,
          fit: BoxFit.cover,
          width: width,
        );
      }),
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        // autoPlayInterval: const Duration(seconds: 2),
        onPageChanged: (index, reason) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget _getSearch() {
    return Positioned(
      // top:0 表示距离父容器（Stack）顶部0像素
      top: 0,
      // left:0 和 right:0 同时设置的作用：
      // 1. 水平方向定位：组件左边缘距离父容器左边0像素，右边缘距离父容器右边0像素
      // 2. 宽度计算：组件宽度会自动扩展为父容器宽度减去left和right的值（这里是全屏宽度）
      // 3. 如果只设置其中一个（如只设置left:0），则组件宽度由其内容决定，不会充满屏幕
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

  int _currentIndex = 0;
  Widget _getDots() {
    return Positioned(
      // bottom:10 表示距离父容器（Stack）底部10像素
      bottom: 10,
      // 同样使用left:0和right:0来实现水平方向充满父容器
      // 这样Row组件可以居中对齐指示器，并且宽度适应屏幕
      left: 0,
      right: 0,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerItems.length, (int index) {
            return GestureDetector(
              onTap: () {
                _carouselController.animateToPage(index);
                setState(() {
                  _currentIndex = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: index == 0 ? 0 : 5),
                height: 6,
                width: 40,
                decoration: BoxDecoration(
                  color: index == _currentIndex ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Text("${index + 1}"),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider(), _getSearch(), _getDots()]);
  }
}
