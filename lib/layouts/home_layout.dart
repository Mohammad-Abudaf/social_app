import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/shared/cubits/appcubit/app_cubit.dart';
import 'package:social_app/shared/cubits/appcubit/app_cubit.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.screenTitle[cubit.screenIndex],
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              IconButton(icon: Icon(Icons.notifications_none), onPressed: (){}),
              IconButton(icon: Icon(Icons.search), onPressed: (){}),
            ],
          ),
          body: cubit.appScreens[cubit.screenIndex],

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.screenIndex,
            onTap: (index){
              cubit.changeScreen(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: 'Chats'),
              BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: 'Users'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
