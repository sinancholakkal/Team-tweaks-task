import 'package:flutter/material.dart';
import 'package:team_week_task/utils/app_sizedbox.dart';
import 'package:team_week_task/utils/app_sizes.dart';
import 'package:team_week_task/utils/app_string.dart';
import 'package:team_week_task/views/widgets/cardregister_form_session.dart';
import 'package:team_week_task/views/widgets/card_top_session.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Card(
              child: SizedBox(
                width: KRwidth,
                height: KRheight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppSizedBox.h20,
                    //Icon and greet------
                    CardTopSession(text: AppStrings.createAnAcc,),
                    //CardLoginFormSession--------
                   CardRegisterFormSession()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}