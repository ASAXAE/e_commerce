//登录接口api
import 'package:e_commerce/constants/index.dart';
import 'package:e_commerce/utils/DioRequest.dart';
import 'package:e_commerce/viewmodels/user.dart';

Future<UserInfo> loginAPI(Map<String, dynamic> data) async {
  return UserInfo.fromJSON(
    await dioRequest.post(HttpConstants.LOGIN, data: data),
  );
}

Future<UserInfo> getUserInfoAPI() async {
  return UserInfo.fromJSON(await dioRequest.get(HttpConstants.USER_PROFILE));
}
