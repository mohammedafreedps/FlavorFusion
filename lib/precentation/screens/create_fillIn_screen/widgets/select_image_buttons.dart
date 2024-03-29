import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_event.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/widgets/create_button_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget selectImageButton(BuildContext context, double screenWidth) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    createButtonOne('Camra', context, screenWidth, function: () {
      context
          .read<CreateFillinBloc>()
          .add(TakeImageFromCameraButtonClickedEvent());
    }),
    createButtonOne('Gallary', context, screenWidth, function: () {
      context
          .read<CreateFillinBloc>()
          .add(TakeImageFromGalleryButtonClickedEvent());
    })
  ]);
}
