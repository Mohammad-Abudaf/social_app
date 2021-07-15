part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SingUpLoadingState extends SignUpState{}
class SingUpSuccessState extends SignUpState{}
class SingUpErrorState extends SignUpState{}

class CreateUserLoadingState extends SignUpState{}
class CreateUserSuccessState extends SignUpState{}
class CreateUserErrorState extends SignUpState{
  final String error;
  CreateUserErrorState(this.error);
}
