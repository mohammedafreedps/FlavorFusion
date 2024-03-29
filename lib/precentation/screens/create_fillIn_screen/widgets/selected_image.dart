import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavorfusion/data/temp_value_holder.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_bloc.dart';
import 'package:flavorfusion/precentation/screens/create_fillIn_screen/bloc/create_fillin_state.dart';
import 'package:flavorfusion/precentation/style_manager/text_style_manager.dart';
import 'package:flavorfusion/precentation/widgets/image_place_holder_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget selectedImage(double screenWidth) {
  return BlocBuilder<CreateFillinBloc, CreateFillinState>(
    builder: (context, state) {
      if (state is ShowSelectedImageState) {
        return AspectRatio(
          aspectRatio: 10 / 3,
          child: Image.file(File(himagePath!)),
        );
      }
      if (state is EditPreviewImageState) {
        return AspectRatio(
            aspectRatio: 10 / 3,
            child: CachedNetworkImage(
              imageUrl: state.imagePath,
              placeholder: (context, url) => imagePlaceHolderText(screenWidth),
            ));
      }
      if (state is SelectImageState) {
        return Text(
          'Select Image',
          style: titleMidiumTextStyle(screenWidth),
        );
      }
      return himagePath != null
          ? AspectRatio(
              aspectRatio: 10 / 3,
              child: Image.file(File(himagePath!)),
            )
          : Text(
              'Select Image',
              style: titleMidiumTextStyle(screenWidth),
            );
    },
  );
}
