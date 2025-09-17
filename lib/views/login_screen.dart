
import 'package:flutter/material.dart';
import 'package:team_week_task/utils/app_sizedbox.dart';
import 'package:team_week_task/utils/app_sizes.dart';
import 'package:team_week_task/views/widgets/cardlogin_form_session.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Card(
            child: SizedBox(
              width: Klwidth,
              height: Klheight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppSizedBox.h20,
                  //Icon and greet------
                 // CardTopSession(image: "asset/medb-logo-png-BRGSYv_I.png",text: AppStrings.welcomeback,),
                  //CardLoginFormSession--------
                  CardLoginFormSession(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

