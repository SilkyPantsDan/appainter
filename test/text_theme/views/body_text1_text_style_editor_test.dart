import 'package:flutter/material.dart';
import 'package:appainter/text_theme/text_theme.dart';

import '../../mocks.dart';
import 'abstract_text_style_editor.dart';

void main() {
  AbstractTextStyleEditorTest<BodyText1TextStyleCubit>(
    editor: const BodyText1TextStyleEditor(),
    initializer: () => MockBodyText1TextStyleCubit(),
    style: Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .bodyText1!,
    expandText: 'Body text 1',
  ).runAllTests();
}
