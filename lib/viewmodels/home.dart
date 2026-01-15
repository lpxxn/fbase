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

/// 商品项数据模型
class GoodsItem {
  final String? id;
  final String? name;
  final String? desc;
  final String? price;
  final String? picture;
  final int? orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    this.orderNum,
  });

  /// 从 JSON 创建 GoodsItem 对象
  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json['id']?.toString(),
      name: json['name']?.toString(),
      desc: json['desc']?.toString(),
      price: json['price']?.toString(),
      picture: json['picture']?.toString(),
      orderNum: json['orderNum'] as int?,
    );
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'picture': picture,
      'orderNum': orderNum,
    };
  }
}

/// 商品列表数据模型（包含分页信息）
class GoodsItems {
  final int? counts;
  final int? pageSize;
  final int? pages;
  final int? page;
  final List<GoodsItem>? items;

  GoodsItems({this.counts, this.pageSize, this.pages, this.page, this.items});

  /// 从 JSON 创建 GoodsItems 对象
  factory GoodsItems.fromJson(Map<String, dynamic> json) {
    List<GoodsItem>? itemsList;
    if (json['items'] != null) {
      itemsList = (json['items'] as List)
          .map((item) => GoodsItem.fromJson(item as Map<String, dynamic>))
          .toList();
    }

    return GoodsItems(
      counts: json['counts'] as int?,
      pageSize: json['pageSize'] as int?,
      pages: json['pages'] as int?,
      page: json['page'] as int?,
      items: itemsList,
    );
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'counts': counts,
      'pageSize': pageSize,
      'pages': pages,
      'page': page,
      'items': items?.map((item) => item.toJson()).toList(),
    };
  }
}

/// 子类型数据模型
class SubType {
  final String? id;
  final String? title;
  final GoodsItems? goodsItems;

  SubType({required this.id, required this.title, this.goodsItems});

  /// 从 JSON 创建 SubType 对象
  factory SubType.fromJson(Map<String, dynamic> json) {
    GoodsItems? goodsItemsObj;
    if (json['goodsItems'] != null) {
      goodsItemsObj = GoodsItems.fromJson(
        json['goodsItems'] as Map<String, dynamic>,
      );
    }

    return SubType(
      id: json['id']?.toString(),
      title: json['title']?.toString(),
      goodsItems: goodsItemsObj,
    );
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'goodsItems': goodsItems?.toJson()};
  }
}

/// 推荐区块数据模型
class RecommendSection {
  final String? id;
  final String? title;
  final List<SubType>? subTypes;

  RecommendSection({required this.id, required this.title, this.subTypes});

  /// 从 JSON 创建 RecommendSection 对象
  factory RecommendSection.fromJson(Map<String, dynamic> json) {
    List<SubType>? subTypesList;
    if (json['subTypes'] != null) {
      subTypesList = (json['subTypes'] as List)
          .map((item) => SubType.fromJson(item as Map<String, dynamic>))
          .toList();
    }

    return RecommendSection(
      id: json['id']?.toString(),
      title: json['title']?.toString(),
      subTypes: subTypesList,
    );
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subTypes': subTypes?.map((item) => item.toJson()).toList(),
    };
  }
}

/// 商品详情项
class GoodDetailItem extends GoodsItem {
  int payCount = 0;

  GoodDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) : super(desc: "");

  // 转化方法
  factory GoodDetailItem.formJSON(Map<String, dynamic> json) {
    return GoodDetailItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      price: json["price"]?.toString() ?? "",
      picture: json["picture"]?.toString() ?? "",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0") ?? 0,
      payCount: int.tryParse(json["payCount"]?.toString() ?? "0") ?? 0,
    );
  }
}
