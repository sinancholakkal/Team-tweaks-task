import 'package:flutter/material.dart';
import 'package:team_week_task/utils/app_color.dart';
import 'package:team_week_task/utils/app_sizedbox.dart';
import 'package:team_week_task/views/widgets/text_feild.dart';

class CardTopSession extends StatelessWidget {
  final String text;
  const CardTopSession({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextWidget(
          text: text,
          color: kBlack,
          fontWeight: FontWeight.bold,
          size: 26,
        );
  }
}
