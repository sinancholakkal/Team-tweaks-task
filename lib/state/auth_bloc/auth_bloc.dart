import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_week_task/models/user_model.dart';
import 'package:team_week_task/services/db_services.dart';
import 'package:team_week_task/services/user_cred.dart';
import 'package:team_week_task/utils/app_string.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final authServices = DbServices();
  AuthBloc() : super(AuthInitial()) {
    on<UserRegisterEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        bool isRegister = await authServices.userRegister(event.userModel);

        if (isRegister) {
          log("Register is success in event");
          emit(AuthLoadedState(message: "Register success!"));
        } else {
          log("Register is field in event");
          emit(AuthErrorState(errorMessage: "Register field!"));
        }
      } catch (e) {
        log("Register is field in event");
        emit(AuthErrorState(errorMessage: e.toString()));
      }
    });
    on<LoaginEvent>((event, emit) async {
      log("Login event entered");
      emit(AuthLoadingState());
      try {
        final userModels = await authServices.userLogin();

        if (userModels.isNotEmpty) {
          for (var model in userModels) {
            if (model.email == event.email &&
                model.password == event.password) {
              emit(AuthLoadedState(message: "Login success!"));
              await UserCred.saveUser(model.email, model.password,model.id!);
            }
          }
          emit(AuthErrorState(errorMessage: "Email and passwod doesn't match"));
        } else {
          log("login is field in event");
          emit(AuthErrorState(errorMessage: "Email and passwod doesn't match"));
        }
      } catch (e) {
        log("login is field in event");
        emit(AuthErrorState(errorMessage: "Login field!"));
      }
    });

    on<UserLogoutEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await authServices.logout();

        emit(AuthLoadedState(message: AppStrings.logoutS));
      } catch (e) {
        emit(AuthErrorState(errorMessage: e.toString()));
      }
    });
  }
}
