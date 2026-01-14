// 首页分类

import 'package:fbase/viewmodels/home.dart';
import 'package:flutter/material.dart';

class HmCategory extends StatefulWidget {
  final List<Category> categoryItems;

  const HmCategory({super.key, required this.categoryItems});

  @override
  _HmCategoryState createState() => _HmCategoryState();
}

class _HmCategoryState extends State<HmCategory> {
  @override
  Widget build(BuildContext context) {
    // 返回一一个点横向滚动的组件
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryItems.length,
        itemBuilder: (context, index) {
          final category = widget.categoryItems[index];
          return Container(
            alignment: Alignment.center,
            width: 80,
            margin: EdgeInsets.symmetric(horizontal: index == 0 ? 0 : 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:
                      category.picture != null && category.picture!.isNotEmpty
                      ? ClipOval(
                          // child: Image.asset("lib/asset/images/ic_sku_img.svg"),
                          // child: Image.asset("lib/asset/images/1.jpg"),
                          child: Image.network(
                            category.picture!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                // const Icon(Icons.error),
                                Image.asset("lib/asset/images/1.jpg"),
                          ),
                        )
                      : Icon(Icons.category, color: Colors.grey[400], size: 30),
                ),
                const SizedBox(height: 5),
                Text(category.name ?? "", style: const TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}
