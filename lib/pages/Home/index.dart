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
    _getRecommendList(); // 获取推荐区块
    _registerEvent();
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

  final _recommendList = [];

  int _page = 1; // 当前页码
  bool _isLoading = false; // 是否正在加载中
  bool _hasMore = true; // 是否还有更多数据

  void _getRecommendList() async {
    if (_isLoading || !_hasMore) return; // 如果正在加载中或没有更多数据，则直接返回
    _isLoading = true; // 设置为正在加载中
    final int limit = _page * 10;
    final recommendList = await getRecommendListAPI({"limit": limit});
    _recommendList.addAll(recommendList);
    _isLoading = false; // 加载完成后设置为false
    setState(() {});
    debugPrint("recommendList.length: ${recommendList.length}");
    if (recommendList.length < limit) {
      _hasMore = false; // 如果返回的数据少于10条，则没有更多数据了
      return;
    }
    _page++; // 加载下一页
  }

  Future<void> _refresh() async {
    _page = 1;
    _isLoading = false; // 刷新时重置为false
    _hasMore = true; // 刷新时重置为true
    _getBannerList(); // 刷新时重新获取banner列表
    _getCategoryList(); // 刷新时重新获取分类列表
    _getInVogueList(); // 刷新时重新获取热榜推荐
    _getOneStopList(); // 刷新时重新获取一站式推荐
    _getRecommendList(); // 重新加载第一页数据
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
      HmMoretList(recommendList: _recommendList),
    ];
  }

  final ScrollController _scrollController = ScrollController();
  void _registerEvent() {
    _scrollController.addListener(() {
      debugPrint("pixels: ${_scrollController.position.pixels}");
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 50) {
        _getRecommendList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: _getScroolChildren(),
    );
  }
}
