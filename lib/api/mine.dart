import 'package:e_commerce/constants/index.dart';
import 'package:e_commerce/utils/DioRequest.dart';
import 'package:e_commerce/viewmodels/Home.dart';

Future<GoodsDetailsItems> getGuessListAPI(Map<String, dynamic> params) async {
  return GoodsDetailsItems.formJSON(
    await dioRequest.get(HttpConstants.GUESS_LIST, params: params),
  );
}
