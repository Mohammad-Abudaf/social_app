part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class AppLoadingState extends AppState{}
class AppSuccessState extends AppState{}
class AppErrorState extends AppState{
  final String error;
  AppErrorState(this.error);
}

class AppChangeScreenBtnNac extends AppState{}


