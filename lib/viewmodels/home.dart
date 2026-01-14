class BannerItem {
  final String? id;
  final String? imgUrl;
  BannerItem({required this.id, required this.imgUrl});

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      id: json['id'] as String? ?? "",
      imgUrl: json['imgUrl'] as String? ?? "",
    );
  }
}

class Category {
  final String? id;
  final String? name;
  final String? picture;
  final List<Category>? children;
  final dynamic goods;

  Category({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
    this.goods,
  });

  /// 从 JSON 创建 Category 对象
  factory Category.fromJson(Map<String, dynamic> json) {
    List<Category>? childrenList;
    if (json['children'] != null) {
      childrenList = (json['children'] as List)
          .map((item) => Category.fromJson(item as Map<String, dynamic>))
          .toList();
    }

    return Category(
      id: json['id']?.toString(),
      name: json['name']?.toString(),
      picture: json['picture']?.toString(),
      children: childrenList,
      goods: json['goods'],
    );
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'picture': picture,
      'children': children?.map((item) => item.toJson()).toList(),
      'goods': goods,
    };
  }
}
