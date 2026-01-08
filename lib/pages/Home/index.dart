import 'package:fbase/components/Home/HmCategory.dart';
import 'package:fbase/components/Home/HmSlider.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 获取滚动窗口的内容
  List<Widget> _getScroolChildren() {
    return [
      // 包裹普通widget的slider家族组件
      const SliverToBoxAdapter(child: Hmslider()),
      // 分类组件
      const SliverToBoxAdapter(child: SizedBox(height: 10)),
      const SliverToBoxAdapter(child: Hmcategory()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScroolChildren());
  }
}
