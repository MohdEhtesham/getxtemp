import 'package:chate/res/components/button.dart';
import 'package:chate/utils/utils.dart';
import 'package:chate/view_models/controller/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

final loginVM= Get.put(LoginViewModel());
final _formKEY=GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("login".tr),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKEY,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginVM.emailController.value,
                    focusNode: loginVM.emailFocusNode.value,
                    validator: (value) {
                      if(value!.isEmpty){

                      Utils.snackBar('Email', 'Enter Email');
                      }
                    },
                    onFieldSubmitted: (value) {
                      
                      Utils.fieldFocusChange(context, loginVM.emailFocusNode.value,loginVM.passwordFocusNode.value);
                    },
                    decoration: InputDecoration(
                      hintText: 'email_hint'.tr,
                      border: OutlineInputBorder(),
                    ),
                  ),
                SizedBox(height: 20,),
                 TextFormField(
                    controller: loginVM.passwordController.value,
                    focusNode: loginVM.passwordFocusNode.value,
                    obscureText: true,
                    obscuringCharacter: '*',
                    validator: (value) {
                      if(value!.isEmpty){

                      Utils.snackBar('Password', 'Enter Password');
                      }
                    },
                    
                    decoration: InputDecoration(
                      hintText: 'password_hint'.tr,
                      border: OutlineInputBorder(),
                    ),
                  ),
                
                ],
              ),
            ),
            SizedBox(height: 40,),
            Obx(() =>    ButtonC(title: 'login'.tr,
            loading:loginVM.loading.value ,
             onPress: (){
              if(_formKEY.currentState!.validate()){
                loginVM.loginApi();

              }
            },width: 200,)
          )
          ],
        ),
      ) ,
    );
  }
}