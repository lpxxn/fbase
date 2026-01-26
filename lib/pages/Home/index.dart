import 'package:fbase/api/home.dart';
import 'package:fbase/components/Home/HmCategory.dart';
import 'package:fbase/components/Home/HmHot.dart';
import 'package:fbase/components/Home/HmMoretList.dart';
import 'package:fbase/components/Home/HmSlider.dart';
import 'package:fbase/components/Home/HmSuggestion.dart';
import 'package:fbase/utils/ToastUtils.dart';
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
    // _getBannerList();
    // _getCategoryList();
    // _getSpecialRecommendSection();
    // _getInVogueList(); // 获取热榜推荐
    // _getOneStopList(); // 获取一站式推荐
    // _getRecommendList(); // 获取推荐区块
    // _registerEvent();
    Future.microtask(() {
      // _paddingTop = MediaQuery.of(context).padding.top;
      _paddingTop = 100;
      setState(() {});
      _refreshIndicatorKey.currentState?.show();
    });
  }
  // 获取推荐区块

  Future<void> _getSpecialRecommendSection() async {
    _specialRecommendSection = await getSpecialRecommendSectionAPI();
    // setState(() {});
  }

  // 获取热榜推荐
  Future<void> _getInVogueList() async {
    _inVogueSection = await getInVogueListAPI();
  }

  // 获取一站式推荐
  Future<void> _getOneStopList() async {
    _oneStopSection = await getOneStopListAPI();
  }

  final _recommendList = [];

  int _page = 1; // 当前页码
  bool _isLoading = false; // 是否正在加载中
  bool _hasMore = true; // 是否还有更多数据

  Future<void> _getRecommendList() async {
    if (_isLoading || !_hasMore) return; // 如果正在加载中或没有更多数据，则直接返回
    _isLoading = true; // 设置为正在加载中
    final int limit = _page * 10;
    final recommendList = await getRecommendListAPI({"limit": limit});
    _recommendList.addAll(recommendList);
    _isLoading = false; // 加载完成后设置为false
    debugPrint("recommendList.length: ${recommendList.length}");
    if (recommendList.length < limit) {
      _hasMore = false; // 如果返回的数据少于10条，则没有更多数据了
      return;
    }
    _page++; // 加载下一页
  }

  Future<void> _refresh() async {
    debugPrint("刷新");
    _page = 1;
    _isLoading = false; // 刷新时重置为false
    _hasMore = true; // 刷新时重置为true
    await _getBannerList(); // 刷新时重新获取banner列表
    await _getSpecialRecommendSection(); // 刷新时重新获取一站式推荐
    await _getCategoryList(); // 刷新时重新获取分类列表
    await _getInVogueList(); // 刷新时重新获取热榜推荐
    await _getOneStopList(); // 刷新时重新获取一站式推荐
    await _getRecommendList(); // 重新加载第一页数据
    ToastUtils.show(context, "刷新成功，共${_recommendList.length}条数据");
    _paddingTop = 0;
    setState(() {});
  }

  Future<void> _getBannerList() async {
    _bannerItems = await getBannerListAPI();
  }

  // 获取分类列表
  Future<void> _getCategoryList() async {
    _categoryItems = await getCategoryListAPI();
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
      // debugPrint("pixels: ${_scrollController.position.pixels}");
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 50) {
        // _getRecommendList();
        _refresh();
      }
    });
  }

  // GlobalKey 用于刷新指示器，是一个方法可以 创建一个key绑定到widget部件上，
  // 然后通过key操作widget部件的方法，例如调用刷新指示器的方法
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  double _paddingTop = 0;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _refresh,
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: _paddingTop),
        duration: const Duration(milliseconds: 300),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: _getScroolChildren(),
        ),
      ),
    );
  }
}
