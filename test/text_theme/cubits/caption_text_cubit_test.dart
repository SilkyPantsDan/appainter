import 'package:flutter/material.dart';
import 'package:appainter/text_theme/text_theme.dart';

import 'abstract_text_style_cubit.dart';

void main() {
  AbstractTextStyleCubitTest(
    initializer: () => CaptionTextStyleCubit(),
    style:
        Typography.englishLike2018.merge(Typography.blackMountainView).caption!,
  ).runAllTests();
}
