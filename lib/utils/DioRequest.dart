import 'package:dio/dio.dart';
import 'package:e_commerce/constants/index.dart';

class DioRequest {
  final _dio = Dio();
  //基础地址拦截器
  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    //拦截器
    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // 在发送请求之前做一些事情
          return handler.next(options); // 继续发送请求
        },
        onResponse: (response, handler) {
          // 在收到响应之前做一些事情
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            // 成功状态码
            return handler.next(response); // 继续处理响应
          }
        },
        onError: (DioException e, handler) {
          // 在发生错误之前做一些事情
          handler.reject(
            DioException(
              requestOptions: e.requestOptions,
              message: e.response?.data['msg'] ?? ' ',
            ),
          );
        },
      ),
    );
  }

  //get请求
  Future<dynamic> get(String url, {Map<String, dynamic>? params}) async {
    return _handleResponse(_dio.get(url, queryParameters: params));
  }

  //定义post接口
  Future<dynamic> post(String url, {Map<String, dynamic>? data}) {
    return _handleResponse(_dio.post(url, data: data));
  }

  //二次处理返回结果的函数
  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> res = await task;
      final data = res.data as Map<String, dynamic>;
      if (data['code'].toString() == GlobalConstants.SUCCESS_CODE) {
        //才认定http状态码和业务状态码都正常 可以放行
        return data['result']; //只要result结果
      } else {
        //throw Exception(data['msg'] ?? '加载数据异常');
        throw DioException(
          requestOptions: res.requestOptions,
          message: data['msg'] ?? '加载数据失败',
        );
      }
    } catch (e) {
      rethrow; //不改变原来抛出的异常类型
    }
  }
}

//单例对象
final dioRequest = DioRequest();

//dio请求工具发出请求 返回的数据 Response<dynamic>.data
//把所有接口的data解放出来 拿到真正的数据 更新判断业务状态码是不是等于1
