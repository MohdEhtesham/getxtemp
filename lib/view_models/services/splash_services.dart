import 'dart:async';

import 'package:chate/res/routes/routes_name.dart';
import 'package:chate/view_models/controller/user_preference/user_preference_view.dart';
import 'package:get/get.dart';

class SplashServices{
UserPreference userPreference=UserPreference();

  void isLogin(){
    userPreference.getUser().then((value) {
      print(value.token);
      if(value.token==null){
 Timer(const Duration(seconds: 4), ()=>Get.toNamed(RouteName.loginView));
      }else{
         Timer(const Duration(seconds: 4), ()=>Get.toNamed(RouteName.homeView));
      }
    },);
   
  }
}