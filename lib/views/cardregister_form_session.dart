import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocConsumer, BlocListener, MultiBlocListener, read, ReadContext;
import 'package:go_router/go_router.dart';
import 'package:team_week_task/state/gender_bloc/gender_bloc.dart';
import 'package:team_week_task/state/image_pick_bloc/image_pick_bloc.dart';
import 'package:team_week_task/utils/app_string.dart';
import 'package:team_week_task/utils/validators.dart';
import 'package:team_week_task/views/widgets/elevated_button.dart';
import 'package:team_week_task/views/widgets/gender_selecter_widget.dart';
import 'package:team_week_task/views/widgets/rich_text_widget.dart';
import 'package:team_week_task/views/widgets/text_form_widget.dart';

class CardRegisterFormSession extends StatefulWidget {
  const CardRegisterFormSession({super.key});

  @override
  State<CardRegisterFormSession> createState() =>
      _CardRegisterFormSessionState();
}

class _CardRegisterFormSessionState extends State<CardRegisterFormSession> {
  final nameController = TextEditingController();
  String? genderController;

  final emailController = TextEditingController();
  final contactNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Uint8List? imagebyte;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return BlocListener<AuthBloc, AuthState>(
    //   listener: (context, state) {
    //     if (state is AuthLoadingState) {
    //       loadingWidget(context);
    //     } else if (state is AuthLoadedState) {
    //       context.pop();
    //       flutterToast(msg: "${state.message}! Please verify your email");
    //       context.go("/login");
    //     } else if (state is AuthErrorState) {
    //       context.pop();
    //       flutterToast(msg: state.errorMessage);
    //     }
    //   },
    //   child:

    return MultiBlocListener(
      listeners: [
        BlocListener<GenderBloc, GenderState>(
          listener: (context, state) {
            if (state is GenderSelectedState) {
              genderController = state.gender;
            } else {
              genderController = null;
            }
          },
        ),
      ],
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            spacing: 22,
            children: [
              //Image selecting
              BlocConsumer<ImagePickBloc, ImagePickState>(
                listener: (context, state) {
                  if (state is ImageSelectedState) {
                    imagebyte = state.image;
                  } else {
                    imagebyte = null;
                  }
                },
                builder: (context, state) {
                  return Stack(
                    children: [
                      CircleAvatar(
                        //It for display image from galary
                        radius: 60,
                        backgroundImage: imagebyte != null
                            ? MemoryImage(imagebyte!)
                            : null,
                      ),
                      Positioned(
                        top: 80,
                        left: 60,
                        child: IconButton(
                          //Pick the image from galery
                          onPressed: () {
                            context.read<ImagePickBloc>().add(ImagePickingEvent());
                          },
                          icon: const Icon(Icons.add_a_photo, size: 30),
                        ),
                      ),
                    ],
                  );
                },
              ),
              //Gender selecter
              GenderChoiceChip(),
              //name----------
              TextFormFieldWidget(
                labeltext: AppStrings.firstname,
                controller: nameController,
                validator: (p0) {
                  return Validation.nameValidate(value: p0, comment: "Name");
                },
              ),

              //Email field---
              TextFormFieldWidget(
                labeltext: AppStrings.email,
                controller: emailController,
                validator: (p0) {
                  return Validation.emailValidation(p0);
                },
              ),
              //ContactNo firld-------
              TextFormFieldWidget(
                labeltext: AppStrings.contactno,
                controller: contactNumberController,
                validator: (p0) {
                  return Validation.phoneNumberValidate(value: p0);
                },
              ),

              //Password field-------
              TextFormFieldWidget(
                type: TypeOfField.password,
                labeltext: AppStrings.password,
                controller: passwordController,
                validator: (p0) {
                  return Validation.passWordValidation(p0);
                },
              ),
              //Conform paswrd field--------
              TextFormFieldWidget(
                type: TypeOfField.password,
                labeltext: AppStrings.conformpassword,
                controller: conformPasswordController,
                validator: (p0) {
                  return Validation.conformPasswordValidation(
                    conformPassword: conformPasswordController.text,
                    password: passwordController.text,
                    value: p0,
                  );
                },
              ),

              //Button for register---------------
              ElevatedWidget(
                text: AppStrings.register,
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      genderController != null) {
                    log(" Validated--------------------");
                    log(genderController.toString());

                    // final registerModel = RegisterModel(
                    //   firstname: firstNameController.text.trim(),
                    //   middlename: middleNameController.text.trim(),
                    //   lastname: lastNameController.text.trim(),
                    //   email: emailController.text.trim(),
                    //   contactno: contactNumberController.text.trim(),
                    //   password: passwordController.text.trim(),
                    //   confirmpassword: conformPasswordController.text.trim(),
                    // );
                    // context.read<AuthBloc>().add(
                    //   RegisterEvent(registerModel: registerModel),
                    // );
                  } else {
                    log("Not Validated--------------------");
                  }
                },
              ),
              //Rich text widget-----------
              RichTextWidget(
                text: AppStrings.alreadycc,
                eventText: " ${AppStrings.login}",
                onTap: () {
                  context.go("/login");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
