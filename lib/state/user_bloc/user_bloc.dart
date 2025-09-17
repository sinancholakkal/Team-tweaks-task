import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_week_task/models/user_model.dart';
import 'package:team_week_task/services/db_services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserGetEvent>((event, emit)async {
      emit(UserLoadingState());
      try{
        final userModel = await DbServices().getUser();
        log(userModel.email);
        log(userModel.key.toString());
        log(userModel.name);
        emit(UserLoadedState(userModel: userModel));
        log("Loaded state emited");
      }catch(e){
        log("Error state from get user event");
        log(e.toString());
      }
    });
  }
}
