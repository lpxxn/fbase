import 'package:fbase/components/Home/HmCategory.dart';
import 'package:fbase/components/Home/HmHot.dart';
import 'package:fbase/components/Home/HmSlider.dart';
import 'package:fbase/components/Home/HmSuggestion.dart';
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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScroolChildren());
  }
}
