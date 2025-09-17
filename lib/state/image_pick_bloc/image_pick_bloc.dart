import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'image_pick_event.dart';
part 'image_pick_state.dart';

class ImagePickBloc extends Bloc<ImagePickEvent, ImagePickState> {
  ImagePickBloc() : super(ImagePickInitial()) {
    on<ImagePickingEvent>((event, emit) async {
      ImagePicker imagePicker = ImagePicker();
      final imgPicked = await imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (imgPicked != null) {
        final Uint8List bytes = await imgPicked.readAsBytes();
        emit(ImageSelectedState(image: bytes));
      }
    });
  }
}
