import 'package:e_commerce/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tokenmanager {
  //返回持久化实例对象
  Future<SharedPreferences> _getInstance() {
    return SharedPreferences.getInstance();
  }

  String _token = '';
  Future<void> init() async {
    final prefs = await _getInstance();
    _token = prefs.getString(GlobalConstants.TOKEN_KEY) ?? '';
  }

  //设置
  Future<void> setToken(String val) async {
    final prefs = await _getInstance();
    prefs.setString(GlobalConstants.TOKEN_KEY, val); //token写入持久化 磁盘
    _token = val;
  }

  //获取用同步
  String getToken() {
    return _token;
  }

  Future<void> removeToken() async {
    final prefs = await _getInstance();
    prefs.remove(GlobalConstants.TOKEN_KEY); //磁盘
    _token = ''; //内存
  }
}

final tokenManager = Tokenmanager();
