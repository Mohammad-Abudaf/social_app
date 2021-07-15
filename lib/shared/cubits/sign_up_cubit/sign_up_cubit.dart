import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_app/models/user_model/user_model.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  SignUpCubit get(context) => BlocProvider.of(context);

  void registerUser({
    @required String firstName,
    @required String lastName,
    @required String userName,
    @required String phoneNumber,
    @required String email,
    @required String password,
  }) {
    emit(CreateUserLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user.email);
      print(value.user.uid);
      createUser(
          firstName: firstName,
          lastName: lastName,
          username: userName,
          email: email,
          password: password,
          phoneNumber: phoneNumber,
          uId: value.user.uid
      );
      emit(CreateUserSuccessState());
    }).catchError((error) {
      print (error.toString());
      emit(CreateUserErrorState(error.toString()));
    });
  }

  void createUser({
    @required String firstName,
    @required String lastName,
    @required String username,
    @required String email,
    @required String password,
    @required String phoneNumber,
    @required String uId,
  }) {
    emit(CreateUserLoadingState());
    UserModel model = UserModel(
      firstName: firstName,
      lastName: lastName,
      userName: username,
      email: email,
      phone: phoneNumber,
      uId: uId,
      password: password,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }
}
