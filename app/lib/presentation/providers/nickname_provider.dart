// Un objeto de tipo AppTheme (custom)
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nicknameProvider = StateProvider<String?>((ref) => null);



// final nicknameNotifierProvider =
//     StateNotifierProvider<NicknameNotifier, AppTheme>(
//   (ref) => NicknameNotifier(),
// );

// // Controller o Notifier
// class NicknameNotifier extends StateNotifier<AppTheme> {
//   // STATE = Estado = new AppTheme();
//   NicknameNotifier() : super(AppTheme());

//   void updateNickname() {
//     state = state.copyWith(isDarkmode: !state.isDarkmode);
//   }
// }
