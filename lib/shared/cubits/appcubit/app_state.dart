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


class AppCreatePostError extends AppState {
  final String error;
  AppCreatePostError(this.error);
}
class AppCreatePostSuccess extends AppState {}
class AppCreatePostLoading extends AppState {}

class AppPickPostImageSuccess extends AppState{}
class AppPickPostImageLoading extends AppState{}
class AppPickPostImageError extends AppState{
  final String error;
  AppPickPostImageError(this.error);
}

class AppRemovePostImage extends AppState{}

class AppGetPostsSuccessState extends AppState{}
class AppGetPostsLoadingState extends AppState{}
class AppGetPostsErrorState extends AppState{
  final String error;
  AppGetPostsErrorState(this.error);

}

class AppLikePostSuccessState extends AppState{}
class AppLikePostErrorState extends AppState{}

class AppGetPostLikesNumberSuccessState extends AppState{}
class AppGetPostLikesNumberErrorState extends AppState{
  final String error;
  AppGetPostLikesNumberErrorState(this.error);

}
