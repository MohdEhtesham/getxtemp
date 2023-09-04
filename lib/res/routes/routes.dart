import 'package:chate/res/routes/routes_name.dart';
import 'package:chate/view/home/home.dart';
import 'package:chate/view/login/login_view.dart';
import 'package:chate/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes{
  static appRoutes()=>[
GetPage(
  name: RouteName.splashScreen, 
  page: ()=>SplashScreen(),
  transitionDuration: Duration(milliseconds: 500),
  transition: Transition.leftToRightWithFade,
  
  ),
  GetPage(
  name: RouteName.loginView, 
  page: ()=>LoginView(),
  transitionDuration: Duration(milliseconds: 500),
  transition: Transition.leftToRightWithFade,
  
  ),
  GetPage(
  name: RouteName.homeView, 
  page: ()=>HomeView(),
  transitionDuration: Duration(milliseconds: 500),
  transition: Transition.leftToRightWithFade,
  
  ),
  ];
}