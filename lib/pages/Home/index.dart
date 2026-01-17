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
  List<Category> _categoryItems = [];
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
  SpecialRecommendSection _specialRecommendSection = SpecialRecommendSection(
    id: "",
    title: "",
    subTypes: [],
  );
  // 热榜推荐
  SpecialRecommendSection _inVogueSection = SpecialRecommendSection(
    id: "",
    title: "",
    subTypes: [],
  );
  // 一站式推荐
  SpecialRecommendSection _oneStopSection = SpecialRecommendSection(
    id: "",
    title: "",
    subTypes: [],
  );

  @override
  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getSpecialRecommendSection();
    _getInVogueList(); // 获取热榜推荐
    _getOneStopList(); // 获取一站式推荐
  }
  // 获取推荐区块

  void _getSpecialRecommendSection() async {
    final specialRecommendSection = await getSpecialRecommendSectionAPI();
    setState(() {
      _specialRecommendSection = specialRecommendSection;
    });
  }

  // 获取热榜推荐
  void _getInVogueList() async {
    final inVogueSection = await getInVogueListAPI();
    setState(() {
      _inVogueSection = inVogueSection;
    });
  }

  // 获取一站式推荐
  void _getOneStopList() async {
    final oneStopSection = await getOneStopListAPI();
    setState(() {
      _oneStopSection = oneStopSection;
    });
  }

  void _getBannerList() async {
    final bannerItems = await getBannerListAPI();
    setState(() {
      _bannerItems = bannerItems;
    });
  }

  // 获取分类列表
  void _getCategoryList() async {
    final categoryItems = await getCategoryListAPI();
    setState(() {
      _categoryItems = categoryItems;
    });
  }

  // 获取滚动窗口的内容
  List<Widget> _getScroolChildren() {
    return [
      // 包裹普通widget的slider家族组件
      SliverToBoxAdapter(child: Hmslider(bannerItems: _bannerItems)),
      // 分类组件
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: HmCategory(categoryItems: _categoryItems),
      ), // 分类组件
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Hmsuggestion(specialRecommendSection: _specialRecommendSection),
      ), // 推荐组件
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                child: Hmhot(rssult: _inVogueSection, type: "hot"),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Hmhot(rssult: _oneStopSection, type: "stop"),
              ),
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
