import 'package:fbase/contants/index.dart';
import 'package:fbase/utils/DioRequest.dart';
import 'package:fbase/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  final responseData = await dioRequest.get(HttpConstants.BANNER_LIST);
  final ret = (responseData as List)
      .map((item) => BannerItem.fromJson(item))
      .toList();
  return ret;
}

Future<List<Category>> getCategoryListAPI() async {
  final responseData = await dioRequest.get(HttpConstants.CATEGORY_LIST);
  final ret = (responseData as List)
      .map((item) => Category.fromJson(item))
      .toList();
  return ret;
}

Future<SpecialRecommendSection> getSpecialRecommendSectionAPI() async {
  final responseData = await dioRequest.get(
    HttpConstants.SPECIAL_RECOMMEND_SECTION,
  );
  final ret = SpecialRecommendSection.fromJson(responseData);
  return ret;
}
