import 'package:chate/models/home/user_list_model.dart';

import '../../data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';

class HomeRepositry{
  final _apiService=NetworkApiServices();

Future<UserListModel>userListApi()async{

  dynamic response=await _apiService.getApi(AppUrl.userListapi);
  return UserListModel.fromJson(response);

}
}