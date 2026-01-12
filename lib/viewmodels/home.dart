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
