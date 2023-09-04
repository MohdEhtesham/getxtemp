import 'package:chate/data/response/status.dart';
import 'package:chate/res/routes/routes_name.dart';
import 'package:chate/view_models/controller/home/home_view_model.dart';
import 'package:chate/view_models/controller/user_preference/user_preference_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController =Get.put(HomeController());
  UserPreference userPreference =UserPreference();
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      actions: [
        IconButton(onPressed: (){
          userPreference.removeUser().then((value){
            Get.toNamed(RouteName.loginView);
          });
        }, icon: Icon(Icons.logout))
      ],
      ),
      body: Obx(() {
        switch(homeController.rxRequestStatus.value){
          case Status.LOADING:
          return Center(child: CircularProgressIndicator());
          case Status.ERROR:
          return Center(child: Text("Something Went wrong"));
          case Status.COMPLETED:
          return ListView.builder(
            itemCount: homeController.userList.value.data!.length,
            itemBuilder: (context,index){
            return Card(
              child: ListTile(
                leading: CircleAvatar(backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString())),
                title: Text(homeController.userList.value.data![index].firstName.toString()),
              ),
            );
          });

        }
        return SizedBox();
      }),
    );
  }
}