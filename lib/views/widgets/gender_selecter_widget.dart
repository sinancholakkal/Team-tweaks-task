import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_week_task/state/gender_bloc/gender_bloc.dart';
import 'package:team_week_task/utils/app_string.dart';

class GenderChoiceChip extends StatefulWidget {
  const GenderChoiceChip({super.key});

  @override
  _GenderChoiceChipState createState() => _GenderChoiceChipState();
}

class _GenderChoiceChipState extends State<GenderChoiceChip> {
  String? _selectedGender;

  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenderBloc, GenderState>(
      listener: (context, state) {
        if(state is GenderSelectedState){
          _selectedGender = state.gender;
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Gender", style: TextStyle(fontSize: 16)),
            Wrap(
              spacing: 10,
              children: AppStrings.genders.map((gender) {
                return ChoiceChip(
                  label: Text(gender),
                  selected: _selectedGender == gender,
                  selectedColor: Colors.blue.shade200,
                  onSelected: (selected) {
                    context.read<GenderBloc>().add(GenderSectingEvent(gender: selected?gender:null));
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 8),
            Text(
              _selectedGender == null
                  ? "No gender selected"
                  : "Selected: $_selectedGender",
                  style: TextStyle(
                    color: (_selectedGender==null)?Colors.red:null
                  ),
            ),
          ],
        );
      },
    );
  }
}
