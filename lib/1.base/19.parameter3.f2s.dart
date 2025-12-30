import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      title: "父传子",
      theme: ThemeData(fontFamily: 'NotoSansSC'),
      home: const Scaffold(body: _MainStatePage()),
    ),
  );
}

class _MainStatePage extends StatefulWidget {
  const _MainStatePage({super.key});

  @override
  _MainStatePageState createState() => _MainStatePageState();
}

class _MainStatePageState extends State<_MainStatePage> {
  @override
  void initState() {
    // TODO: implement initState

    _getChannels();
  }

  List<Map<String, dynamic>> _list = [];
  void _getChannels() async {
    try {
      final response = await DioUtils().get("channels");
      // list = response.data!["data"]["channels"]
      //     .map((e) => e["name"])
      //     .toList();
      final Map<String, dynamic> res = response.data as Map<String, dynamic>;
      final List data = res["data"]["channels"] as List;
      _list = data.cast<Map<String, dynamic>>();

      setState(() {});
      print(_list);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // var list = ["红烧肉", "鱼香肉丝", "青椒肉丝", "佛跳墙", "西芹肉丝"];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("父组件"),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisCount: 2,
            mainAxisSpacing: 10, // 主轴方向间距
            crossAxisSpacing: 5, // 交叉轴方向间距
            children: List.generate(
              _list.length,
              (index) => childStatePage(message: _list[index]),
            ),
          ),
        ),
      ],
    );
  }
}

class childStatePage extends StatefulWidget {
  final Map<String, dynamic>? message;
  const childStatePage({super.key, required this.message});

  @override
  _childStatePageState createState() => _childStatePageState();
}

class _childStatePageState extends State<childStatePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        widget.message?["name"] ?? "没有数据",
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}

class DioUtils {
  final Dio _dio = Dio();

  DioUtils() {
    _dio.options
      ..baseUrl = "https://geek.itheima.net/v1_0/"
      ..connectTimeout = const Duration(seconds: 10)
      ..sendTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 10);

    _addInterceptor();
  }

  void _addInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // 在发送请求之前做一些事情
          return handler.next(options); // 继续发送请求
        },
        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            return handler.next(response); // 继续处理响应
          }
          return handler.reject(
            DioException(requestOptions: response.requestOptions),
          ); // 拒绝处理响应
        },
        onError: (DioException e, handler) {
          // 在发生错误之前做一些事情
          // return handler.next(e); // 继续处理错误
          handler.reject(e);
        },
      ),
    );
  }

  Future<Response<dynamic>> get(String url, {Map<String, dynamic>? params}) {
    return _dio.get(url, queryParameters: params);
  }
}
