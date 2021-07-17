part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppLoadingState extends AppState {}

class AppSuccessState extends AppState {}

class AppErrorState extends AppState {
  final String error;
  AppErrorState(this.error);
}

class AppChangeScreenBtnNac extends AppState {}

class AppAddNewPostScreen extends AppState {}

class AppUpPickNewProfilePicSuccess extends AppState {}

class AppUpPickNewProfilePicError extends AppState {}

class AppPickNewCoverPicSuccess extends AppState {}

class AppPickNewCoverPicError extends AppState {}

class AppUpUploadNewProfilePicSuccess extends AppState {}

class AppUpUploadNewProfilePicError extends AppState {}

class AppUpdateDataError extends AppState {}
class AppUpdateDataLoading extends AppState {}

