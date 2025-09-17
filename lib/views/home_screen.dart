import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:team_week_task/state/auth_bloc/auth_bloc.dart';
import 'package:team_week_task/utils/app_color.dart';
import 'package:team_week_task/utils/app_string.dart';
import 'package:team_week_task/views/loading.dart';
import 'package:team_week_task/views/widgets/show_diolog.dart';
import 'package:team_week_task/views/widgets/toast.dart';
import 'package:team_week_task/views/widgets/user_details_session.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Team Tweaks"), centerTitle: true),
      //UserDetailsSession------------
      body: UserDetailsSession(),
      floatingActionButton: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoadingState) {
            loadingWidget(context);
          } else if (state is AuthLoadedState) {
            context.pop();
            flutterToast(msg: state.message);
            context.go("/login");
          } else if (state is AuthErrorState) {
            context.pop();
            flutterToast(msg: state.errorMessage);
          }
        },
        child: FloatingActionButton(
          onPressed: () {
            showDiolog(
              context: context,
              title: "Logout",
              content: "Are you sure you want to log out?",
              cancelTap: () => context.pop(),
              confirmTap: () {
                context.read<AuthBloc>().add(UserLogoutEvent());
              },
            );
          },
          child: Icon(Icons.logout),
        ),
      ),
    );
  }
}

