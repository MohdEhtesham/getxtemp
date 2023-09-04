import 'package:chate/pages/frame/welcome/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  Widget _buildPageHEadTitle(String title){
    return Container(
      child: Text(
        title,
        style: TextStyle(
          color:Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 45

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildPageHEadTitle(controller.title),
      ),
    );
  }
}