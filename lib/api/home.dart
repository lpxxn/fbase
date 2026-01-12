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
