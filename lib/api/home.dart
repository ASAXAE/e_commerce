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

//分类列表
Future<List<CategoryItem>> getCategoryListAPI() async {
  //返回请求
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((
    item,
  ) {
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
}

//特惠推荐
Future<SpecialRecommendResult> getSpecialRecommendListAPI() async {
  //返回请求
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(HttpConstants.PRODUCT_LIST),
  );
}

// 热榜推荐
Future<SpecialRecommendResult> getInVogueListAPI() async {
  // 返回请求
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(HttpConstants.IN_VOGUE_LIST),
  );
}

// 一站式推荐
Future<SpecialRecommendResult> getOneStopListAPI() async {
  // 返回请求
  return SpecialRecommendResult.fromJson(
    await dioRequest.get(HttpConstants.ONE_STOP_LIST),
  );
}

// 推荐列表
Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  // 返回请求
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, params: params))
          as List)
      .map((item) {
        return GoodDetailItem.formJSON(item as Map<String, dynamic>);
      })
      .toList();
}
