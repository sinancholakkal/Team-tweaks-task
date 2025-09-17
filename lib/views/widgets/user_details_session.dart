import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_week_task/state/user_bloc/user_bloc.dart';
import 'package:team_week_task/utils/app_color.dart';
import 'package:team_week_task/utils/app_string.dart';

class UserDetailsSession extends StatefulWidget {
  const UserDetailsSession({super.key});

  @override
  State<UserDetailsSession> createState() => _UserDetailsSessionState();
}

class _UserDetailsSessionState extends State<UserDetailsSession> {
  @override
  void initState() {
    context.read<UserBloc>().add(UserGetEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if(state is UserLoadingState){
          return Center(child: CircularProgressIndicator(),);
        }else if(state is UserLoadedState){
          final userModel = state.userModel;
          return SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(100, 200),
                      ),
                    ),

                    child: Center(
                      child: Text(
                        "PROFILE",
                        style: TextStyle(
                          color: kWhite,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        Card(
                          child: ListTile(
                            title: const Text(AppStrings.name), //user name
                            subtitle: Text(userModel.name),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: const Text(AppStrings.email), //user email
                            subtitle: Text(userModel.email),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: const Text("Gender"), //user Gender
                            subtitle: Text(userModel.gender),
                          ),
                        ),
                        Card(
                          child: ListTile(
                            title: const Text(AppStrings.contactno), //user Contact number
                            subtitle: Text(userModel.phone),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 140),
                child: Center(
                  child: CircleAvatar(
                    radius: 70,
                    //backgroundImage: FileImage(File(data.profilePath)),
                     backgroundImage: MemoryImage(userModel.profile),
                  ),
                ),
              ),
            ],
          ),
        );
        }
        return SizedBox();
      },
    );
  }
}
