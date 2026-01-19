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

// 热榜推荐
Future<SpecialRecommendSection> getInVogueListAPI() async {
  final responseData = await dioRequest.get(HttpConstants.IN_VOGUE_LIST);
  final ret = SpecialRecommendSection.fromJson(responseData);
  return ret;
}

// 一站式推荐
Future<SpecialRecommendSection> getOneStopListAPI() async {
  final responseData = await dioRequest.get(HttpConstants.ONE_STOP_LIST);
  final ret = SpecialRecommendSection.fromJson(responseData);
  return ret;
}

Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  final responseData = await dioRequest.get(
    HttpConstants.RECOMMEND_LIST,
    params: params,
  );
  final ret = (responseData as List)
      .map((item) => GoodDetailItem.formJSON(item))
      .toList();
  return ret;
}
