import 'package:dio/dio.dart';
import 'package:fbase/contants/index.dart';

class DioRequest {
  final Dio _dio = Dio();

  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = const Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = const Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = const Duration(seconds: GlobalConstants.TIME_OUT);

    _addInterceptor();
  }

  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            return handler.next(response);
          }

          return handler.reject(
            DioException(requestOptions: response.requestOptions),
          );
        },
        onError: (error, handler) {
          return handler.reject(error);
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) async {
    return await handleRespose(_dio.get(url, queryParameters: params));
  }

  // 进一步处理返回结果
  Future<dynamic> handleRespose(Future<Response<dynamic>> task) async {
    try {
      final response = await task;
      final data = response.data as Map<String, dynamic>;
      if (data['code'] == GlobalConstants.SUCCESS_CODE) {
        return data['result'];
      }
      throw Exception(data['msg'] ?? "加载数据错误");
    } catch (e) {
      throw Exception(e);
    }
  }
}

final dioRequest = DioRequest(); // 单例模式
