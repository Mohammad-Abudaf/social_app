import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_app/models/user_model/user_model.dart';
import 'package:social_app/modules/chats/chats_sreen.dart';
import 'package:social_app/modules/feeds/feeds_screen.dart';
import 'package:social_app/modules/settings/settings_screen.dart';
import 'package:social_app/modules/users/users_screen.dart';
import 'package:social_app/shared/componants/constats.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  UserModel userModel;

  void getUserData() {
    emit(AppLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(token)
        .get()
        .then((value) {
          print (value.data());
          userModel = UserModel.fromJson(value.data());
          print(userModel.isEmailVerified);
          print (userModel.userName);
          emit(AppSuccessState());
    })
        .catchError((error) {
          print (error.toString());
          emit(AppErrorState(error.toString()));
    });
  }

  int screenIndex = 0;
  List <Widget> appScreens = [
    NewsFeedScreen(),
    ChatsScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  List<String> screenTitle = ['News Feed', 'Chats', 'Users', 'Settings'];

  void changeScreen(int index){
    screenIndex = index;
    emit(AppChangeScreenBtnNac());
  }
}
