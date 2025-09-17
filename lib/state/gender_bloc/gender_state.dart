part of 'gender_bloc.dart';

@immutable
sealed class GenderState {}

final class GenderInitial extends GenderState {}

class GenderSelectedState extends GenderState{
  final String? gender;

  GenderSelectedState({required this.gender});
}
