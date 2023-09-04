
import 'package:chate/res/assets/image_assets.dart';
import 'package:chate/res/components/button.dart';
import 'package:chate/res/components/general_exception.dart';
import 'package:chate/res/components/internet_exceptions_widget.dart';
import 'package:chate/utils/utils.dart';
import 'package:chate/view_models/services/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
SplashServices splashScreen =SplashServices();

  @override
  void initState() {
    super.initState();
    splashScreen.isLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor: Colors.teal,
    );
  }
}