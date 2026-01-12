import 'package:fbase/api/home.dart';
import 'package:fbase/components/Home/HmCategory.dart';
import 'package:fbase/components/Home/HmHot.dart';
import 'package:fbase/components/Home/HmMoretList.dart';
import 'package:fbase/components/Home/HmSlider.dart';
import 'package:fbase/components/Home/HmSuggestion.dart';
import 'package:fbase/viewmodels/home.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannerItems = [];
  // final List<BannerItem> _bannerItems = [
  //   BannerItem(
  //     id: "1",
  //     imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/1.jpg",
  //   ),
  //   BannerItem(
  //     id: "2",
  //     imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/2.png",
  //   ),
  //   BannerItem(
  //     id: "3",
  //     imgUrl: "https://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/meituan/3.jpg",
  //   ),
  // ];

  @override
  void initState() {
    super.initState();
    _getBannerList();
  }

  void _getBannerList() async {
    final bannerItems = await getBannerListAPI();
    setState(() {
      _bannerItems = bannerItems;
    });
  }

  // 获取滚动窗口的内容
  List<Widget> _getScroolChildren() {
    return [
      // 包裹普通widget的slider家族组件
      SliverToBoxAdapter(child: Hmslider(bannerItems: _bannerItems)),
      // 分类组件
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      const SliverToBoxAdapter(child: Hmcategory()), // 分类组件
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      const SliverToBoxAdapter(child: Hmsuggestion()), // 推荐组件
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: Hmhot()),
              SizedBox(width: 10),
              Expanded(child: Hmhot()),
            ],
          ),
        ),
      ),
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      const HmMoretList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScroolChildren());
  }
}
