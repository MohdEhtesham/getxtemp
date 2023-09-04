import 'package:chate/data/response/status.dart';
import 'package:chate/models/home/user_list_model.dart';
import 'package:chate/repository/home_repository/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final _api =HomeRepositry();


final rxRequestStatus=Status.LOADING.obs;
final userList=UserListModel().obs;


void setRxRequests(Status _value)=>rxRequestStatus.value=_value;
void setUserList(UserListModel _value)=>userList.value=_value;

  void userListApi(){

    _api.userListApi().then((value) {
      setRxRequests(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setRxRequests(Status.ERROR);

    });
  }
}