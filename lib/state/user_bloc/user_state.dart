part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}
class UserLoadingState extends UserState{}
class UserLoadedState extends UserState{
  final UserModel userModel;

  UserLoadedState({required this.userModel});
  
}