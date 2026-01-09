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

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_getSlider()]);
  }
}
