import 'package:e_learning/cubit/settings/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../res/consts.dart';
import '../../view_model/model/setting/Faq.dart';
import '../../view_model/model/setting/Terms.dart';
import '../../view_model/network/dio_helper.dart';
import '../../view_model/network/end_points.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(context) => BlocProvider.of(context);

  Faq? faq ;
  void getFAQ() {
    emit(GetAllFAQLoadingState());
    DioHelper.getData(
      url: faqEndPoint,
      token:accessToken,
    ).then((value) {
      print(value.statusMessage);
      faq = Faq.fromJson(value.data);
      emit(GetAllFAQSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllFAQErrorState());
    });
  }


  Terms? terms ;
  void getTerms() {
    emit(GetAllTermLoadingState());
    DioHelper.getData(
      url: termsEndPoint,
      token:accessToken,
    ).then((value) {
      print(value.statusMessage);
      terms = Terms.fromJson(value.data);
      emit(GetAllTermSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllTermErrorState());
    });
  }


}
