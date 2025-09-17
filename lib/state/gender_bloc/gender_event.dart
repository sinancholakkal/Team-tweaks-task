part of 'gender_bloc.dart';

@immutable
sealed class GenderEvent {}

class GenderSectingEvent extends GenderEvent{
  final String? gender;

  GenderSectingEvent({required this.gender});
  
}
