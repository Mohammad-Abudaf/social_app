part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SingUpLoadingState extends SignUpState{}
class SingUpSuccessState extends SignUpState{}
class SingUpErrorState extends SignUpState{}
