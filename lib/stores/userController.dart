import 'package:e_commerce/viewmodels/user.dart';
import 'package:get/get.dart';

//需要共享的对象 要有一些共享的属性 属性需要响应式更新
class userController extends GetxController {
  var user = UserInfo.fromJSON({}).obs; //.obs 被监听
  //取值 user.value
  updateUserInfo(UserInfo newUser) {
    user.value = newUser;
  }
}
