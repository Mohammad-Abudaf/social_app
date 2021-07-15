import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  SignUpCubit get(context) => BlocProvider.of(context);

  void postData({
  @required String firstName,
  @required String lastName,
  @required String userName,
  @required String phoneNumber,
  @required String email,
  @required String password,
  @required String confirmPassword,
}){
    emit(SingUpLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value) {
      print (value.user.email);
      print (value.user.uid);
      emit(SingUpSuccessState());
    }
    ).catchError((){
      emit(SingUpErrorState());
    });
  }
}
