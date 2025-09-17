part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {
  final String message;

  AuthLoadedState({required this.message});
}
class AuthErrorState extends AuthState{
  final String errorMessage;

  AuthErrorState({required this.errorMessage});
  
}