import 'package:chate/models/login/user_model.dart';
import 'package:chate/res/routes/routes_name.dart';
import 'package:chate/utils/utils.dart';
import 'package:chate/view_models/controller/user_preference/user_preference_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repository/login_repository/login_repository.dart';

class LoginViewModel extends GetxController{

final _api=LoginRepositry();
UserPreference userPreference=UserPreference();

  final emailController =TextEditingController().obs;
  final passwordController =TextEditingController().obs;


  final emailFocusNode =FocusNode().obs;
  final passwordFocusNode =FocusNode().obs;
  
  RxBool loading=false.obs;
void loginApi(){
loading.value=true;
Map data={
   "email":emailController.value.text ,
   "password": passwordController.value.text,
};
_api.loginApi(data).then((value){
  loading.value=false;
  if(value['error']=='user not found'){
Utils.snackBar('Login', value['error']);

  }else{
userPreference.saveUser(UserModel.fromJson(value)).then((value){
Get.toNamed(RouteName.homeView);
}).onError((error, stackTrace){

});
Utils.snackBar('Login', 'Login Successfully');
  }
}).onError((error, stackTrace){
  print(error.toString());
  loading.value=false;
Utils.snackBar('Error', error.toString());
});

}
}