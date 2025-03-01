import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/common/consts.dart';
import 'package:appainter/icon_theme/icon_theme.dart';
import 'package:appainter/widgets/widgets.dart';

class IconThemeEditor extends ExpansionPanelItem {
  const IconThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Icon theme';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IconThemeCubit, IconThemeState>(
      builder: (context, state) {
        return IconThemeCard(
          key: const Key('iconThemeEditor_iconThemeCard'),
          color: state.theme.color ?? kIconThemeColor,
          onColorChanged: (color) {
            context.read<IconThemeCubit>().colorChanged(color);
          },
          size: state.theme.size ?? kIconThemeSize,
          onSizeChanged: (value) {
            context.read<IconThemeCubit>().sizeChanged(value);
          },
          opacity: state.theme.opacity ?? kIconThemeOpacity,
          onOpacityChanged: (value) {
            context.read<IconThemeCubit>().opacityChanged(value);
          },
        );
      },
    );
  }
}
