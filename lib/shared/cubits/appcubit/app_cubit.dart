import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:social_app/models/post_model/post_model.dart';
import 'package:social_app/models/user_model/user_model.dart';
import 'package:social_app/modules/chats/chats_sreen.dart';
import 'package:social_app/modules/feeds/feeds_screen.dart';
import 'package:social_app/modules/new_post/new_post_screen.dart';
import 'package:social_app/modules/settings/settings_screen.dart';
import 'package:social_app/modules/users/users_screen.dart';
import 'package:social_app/shared/componants/constats.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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
      print(value.data());
      userModel = UserModel.fromJson(value.data());
      print(userModel.isEmailVerified);
      print(userModel.userName);
      emit(AppSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AppErrorState(error.toString()));
    });
  }

  int screenIndex = 0;
  List<Widget> appScreens = [
    NewsFeedScreen(),
    ChatsScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  List<String> screenTitle = [
    'News Feed',
    'Chats',
    'New Post',
    'Users',
    'Settings'
  ];

  void changeScreen(int index) {
    if (index == 2) {
      emit(AppAddNewPostScreen());
    } else {
      screenIndex = index;
      emit(AppChangeScreenBtnNac());
    }
    print(index);
  }

  File profileImage;
  final profilePicker = ImagePicker();

  Future getProfileImage() async {
    final pickedFile =
        await profilePicker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(AppUpPickNewProfilePicSuccess());
    } else {
      print('No image selected.');
      emit(AppUpPickNewProfilePicError());
    }
  }

  File coverImage;
  final coverPicker = ImagePicker();

  Future getCoverImage() async {
    final pickedFile = await coverPicker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(AppPickNewCoverPicSuccess());
    } else {
      print('No image selected.');
      emit(AppPickNewCoverPicError());
    }
  }

  String profileImageUrl = '';

  void uploadProfilePic({
    @required String email,
    @required String phone,
    @required String userName,
    @required String bio,
    String image,
    String coverImage,
  }) {
    emit(AppUpdateDataLoading());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(AppUpUploadNewProfilePicSuccess());
        profileImageUrl = value.toString();
        updateUserData(
            email: email,
            phone: phone,
            userName: userName,
            bio: bio,
            profileImage: value.toString());

        print(profileImageUrl);
      }).catchError((error) {
        emit(AppUpUploadNewProfilePicError());
      });
    }).catchError((error) {
      emit(AppUpUploadNewProfilePicError());
    });
  }

  String coverImageUrl = '';

  void uploadCoverPic({
    @required String email,
    @required String phone,
    @required String userName,
    @required String bio,
    String image,
  }) {
    emit(AppUpdateDataLoading());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage.path).pathSegments.last}')
        .putFile(coverImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(AppUpUploadNewProfilePicSuccess());
        coverImageUrl = value.toString();
        updateUserData(
            email: email,
            phone: phone,
            userName: userName,
            bio: bio,
            coverImage: value.toString());
        print(coverImageUrl);
      }).catchError((error) {
        emit(AppUpUploadNewProfilePicError());
      });
    }).catchError((error) {
      emit(AppUpUploadNewProfilePicError());
    });
  }

  void updateUserData({
    @required String email,
    @required String phone,
    @required String userName,
    @required String bio,
    String profileImage,
    String coverImage,
  }) {
    emit(AppUpdateDataLoading());
    UserModel model = UserModel(
      email: email,
      bio: bio,
      phone: phone,
      image: profileImage ?? userModel.image,
      coverImage: coverImage ?? userModel.coverImage,
      uId: userModel.uId,
      userName: userName,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      print(error.toString());
      emit(AppUpdateDataError());
    });
  }

  File postImage;
  final postImagePicker = ImagePicker();

  Future getPostImage() async {
    final pickedFile =
        await postImagePicker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(AppPickPostImageSuccess());
    } else {
      print('No image selected.');
      emit(AppPickPostImageError('error piked image!'));
    }
  }

  void uploadPostImage({
    @required String text,
    @required String timeDate,
  }) {
    emit(AppCreatePostLoading());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage.path).pathSegments.last}')
        .putFile(postImage)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createPost(text: text, timeDate: timeDate, postImage: value);
      }).catchError((error) {
        emit(AppCreatePostError(onError.toString()));
      });
      emit(AppCreatePostSuccess());
    }).catchError((onError) {
      emit(AppCreatePostError(onError.toString()));
    });
  }

  void createPost({
    @required String text,
    @required String timeDate,
    String postImage,
  }) {
    emit(AppCreatePostLoading());
    PostModel postModel = PostModel(
      userName: userModel.userName,
      uId: userModel.uId,
      userImage: userModel.image,
      text: text,
      dateTime: timeDate,
      postImage: postImage?? '',
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(postModel.toMap())
        .then((value) {
      emit(AppCreatePostSuccess());
    }).catchError((error) {
      emit(AppCreatePostError(error.toString()));
    });
  }

  void removePostImage() {
    postImage = null;
    emit(AppRemovePostImage());
  }

  List<PostModel> posts = [];
  List<String> postsID = [];
  List<int> postsLikesNumber = [];

  void getPost() {
    emit(AppCreatePostLoading());
    PostModel postModel = PostModel();
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value) {
          emit(AppGetPostsSuccessState());
          value.docs.forEach((element) {
            element.reference.collection('likes').get().then((value){
              postsLikesNumber.add(value.docs.length);
              posts.add(PostModel.fromJson(element.data()));
              postsID.add(element.id);
              emit(AppGetPostLikesNumberSuccessState());
            }).catchError((error){
              emit(AppGetPostLikesNumberErrorState(error.toString()));
            });
          });
    }).catchError((error){
      emit(AppGetPostsErrorState(error.toString()));
    });
  }

  void likePost(String postId){
    FirebaseFirestore.instance.collection('posts').doc(postId).collection('likes').doc(userModel.uId).set(
        {'like': true}).then((value) {
          emit (AppLikePostSuccessState());
    }).catchError((error){
      emit(AppLikePostErrorState());
    });
  }
}
