//封装一个api 返回业务侧要求的数据结构
import 'package:e_commerce/constants/index.dart';
import 'package:e_commerce/utils/DioRequest.dart';
import 'package:e_commerce/viewmodels/Home.dart';

Future<List<BannerItem>> getBannerListAPI() async {
  //返回请求
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((
    item,
  ) {
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}
