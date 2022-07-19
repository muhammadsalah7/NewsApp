// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_string_interpolations
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/network/local/cache_helper.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
    }

    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
      emit(AppChangeModeState());
    });
  }
  // ignore: curly_braces_in_flow_control_structures
}
