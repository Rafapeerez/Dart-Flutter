import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final colorListProvider = Provider((ref) => colorList); //Inmutable

final isDarkModeProvider = StateProvider<bool>((ref) => false);

final selectedColorProvider = StateProvider((ref) => 0);

// An Apptheme object (custom)
// El stateNotifierProvider nos permite almacenar un estado mas complejo, ese estado es manejado por el
//themeNotifier
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  //Satate = AppTheme Instance
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
