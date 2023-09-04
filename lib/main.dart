import 'package:chate/res/getx_localization/languages.dart';
import 'package:chate/res/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "chate",
      translations: Languages(),
      locale: Locale('en','US'),
      fallbackLocale: Locale('en','US'),
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
      ),
     getPages: AppRoutes.appRoutes(),
    );
  }
}