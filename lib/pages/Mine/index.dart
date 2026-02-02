import 'package:flutter/material.dart';

class MineView extends StatefulWidget {
  const MineView({super.key});

  @override
  _MineViewState createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  Widget _getLogout() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("确认退出登录吗？"),
              content: const Text("确认退出登录吗？"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("取消"),
                ),
                TextButton(onPressed: () {}, child: const Text("确认")),
              ],
            );
          },
        );
      },
      child: const Text("退出"),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFFF2E8), Color(0xFFFDF6F1)],
        ),
      ),
      padding: const EdgeInsets.only(left: 20, right: 40, top: 80, bottom: 20),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundImage: AssetImage("lib/asset/images/goods_avatar.png"),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "登录",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVipCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 240, 192, 155),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              "lib/asset/images/ic_user_vip.png",
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                '升级美荟商城会员，尊享无限免邮',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(126, 43, 26, 1),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromRGBO(126, 43, 26, 1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: const Text('立即开通', style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    Widget item(String pic, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(pic, width: 30, height: 30, fit: BoxFit.cover),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            item("lib/asset/images/ic_user_collect.png", "我的收藏"),
            item("lib/asset/images/ic_user_history.png", "我的足迹"),
            item("lib/asset/images/ic_user_unevaluated.png", "我的客服"),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderModule() {
    Widget orderItem(String pic, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(pic, width: 30, height: 30, fit: BoxFit.cover),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "订单管理",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  orderItem("lib/asset/images/ic_user_order.png", "我的订单"),
                  orderItem("lib/asset/images/ic_user_obligation.png", "待付款"),
                  orderItem("lib/asset/images/ic_user_unreceived.png", "待发货"),
                  orderItem("lib/asset/images/ic_user_unshipped.png", "待收货"),
                  orderItem("lib/asset/images/ic_user_unevaluated.png", "待评价"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildHeader()),
        SliverToBoxAdapter(child: _buildVipCard()),
        SliverToBoxAdapter(child: _buildQuickActions()),
        SliverToBoxAdapter(child: _buildOrderModule()),
      ],
    );
  }
}
