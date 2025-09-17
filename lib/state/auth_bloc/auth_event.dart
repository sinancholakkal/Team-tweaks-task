part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class UserRegisterEvent extends AuthEvent{
  final UserModel userModel;

  UserRegisterEvent({required this.userModel});
  
}