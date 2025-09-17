part of 'image_pick_bloc.dart';

@immutable
sealed class ImagePickState {}

final class ImagePickInitial extends ImagePickState {}
class ImageSelectedState extends ImagePickState{
  final Uint8List image;

  ImageSelectedState({required this.image});
}