import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/models/models.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

part 'advanced_theme_cubit.g.dart';
part 'advanced_theme_state.dart';
part 'app_bar_cubit.dart';

class AdvancedThemeCubit extends Cubit<AdvancedThemeState> {
  AdvancedThemeCubit() : super(AdvancedThemeState());

  void themeDataChanged(ThemeData theme) {
    emit(state.copyWith(themeData: theme));
  }

  void randomizedThemeRequested() {
    emit(
      state.copyWith(
        themeData: ThemeData.from(
          colorScheme: randomColorSchemeLight(
            seed: DateTime.now().millisecondsSinceEpoch,
          ),
        ),
      ),
    );
  }

  void defaultThemeRequested() {
    emit(
      state.copyWith(
        themeData: ThemeData.localize(
          ThemeData(),
          Typography.englishLike2018,
        ),
      ),
    );
  }
}
