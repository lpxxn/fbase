import 'package:fbase/contants/index.dart';
import 'package:fbase/utils/DioRequest.dart';
import 'package:fbase/viewmodels/home.dart';

Future<GoodsDetailsItems> getGuessListAPI(Map<String, dynamic> params) async {
  final responseData = await dioRequest.get(
    HttpConstants.GUESS_LIST,
    params: params,
  );
  final ret = GoodsDetailsItems.formJSON(responseData);
  return ret;
}
