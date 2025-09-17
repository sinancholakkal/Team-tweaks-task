import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:team_week_task/utils/app_color.dart';
import 'package:team_week_task/utils/app_string.dart';
import 'package:team_week_task/utils/validators.dart';
import 'package:team_week_task/views/widgets/elevated_button.dart';
import 'package:team_week_task/views/widgets/rich_text_widget.dart';
import 'package:team_week_task/views/widgets/text_feild.dart';
import 'package:team_week_task/views/widgets/text_form_widget.dart';

class CardLoginFormSession extends StatefulWidget {
  const CardLoginFormSession({super.key});

  @override
  State<CardLoginFormSession> createState() => _CardLoginFormSessionState();
}

class _CardLoginFormSessionState extends State<CardLoginFormSession> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            spacing: 22,
            children: [
              TextFormFieldWidget(
                labeltext: AppStrings.email,
                controller: emailController,
                prefixIcon: Icons.email_outlined,
                validator: (p0) {
                  return Validation.emailValidation(p0);
                },
              ),
              TextFormFieldWidget(
                type: TypeOfField.password,
                labeltext: AppStrings.password,
                controller: passwordController,
                prefixIcon: Icons.lock_outline_rounded,
                validator: (p0) {
                  return Validation.passWordValidation(p0);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.lock_outline, color: kBlue, size: 18),

                  TextWidget(
                    text: AppStrings.forgotPassword,
                    color: kBlue,
                    size: 16,
                  ),
                ],
              ),
              //Button for navigation---------------
              ElevatedWidget(
                text: AppStrings.login,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    log(" Validated--------------------");

                    // final loginModel = LoginModel(
                    //   email: emailController.text.trim(),
                    //   password: passwordController.text.trim(),
                    // );
                    // log("Login Bloc called");
                    // context.read<AuthBloc>().add(
                    //   LoginEvent(loginModel: loginModel),
                    // );
                  } else {
                    log("Not Validated--------------------");
                  }
                },
              ),
              //Rich text widget-----------
              RichTextWidget(
                text: AppStrings.dontaccount,
                eventText: " ${AppStrings.register}",
                onTap: () {
                  context.go("/register");
                },
              ),
            ],
          ),
        ),
      );
  }
}
