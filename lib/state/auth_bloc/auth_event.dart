part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class UserRegisterEvent extends AuthEvent{
  final UserModel userModel;

  UserRegisterEvent({required this.userModel});
  
}

class LoaginEvent extends AuthEvent{
  final String email;
  final String password;

  LoaginEvent({required this.email, required this.password});
  
}

class UserLogoutEvent extends AuthEvent{}