import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_week_task/models/user_model.dart';
import 'package:team_week_task/services/db_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final authServices = DbServices();
  AuthBloc() : super(AuthInitial()) {
    on<UserRegisterEvent>((event, emit) async{
     emit(AuthLoadingState());
      try {
        bool isRegister = await authServices.userRegister(event.userModel);
      
        if(isRegister){
          log("Register is success in event");
          emit(AuthLoadedState(message: "Register success!"));
        }else{
          log("Register is field in event");
          emit(AuthErrorState(errorMessage: "Login field!"));
        }
      } catch (e) {
        log("Register is field in event");
        emit(AuthErrorState(errorMessage: "Login field!"));
      }
    });
  }
}
