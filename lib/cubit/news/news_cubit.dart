import 'package:e_learning/view_model/network/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../res/consts.dart';
import '../../view_model/model/news/news.dart';
import '../../view_model/network/dio_helper.dart';
import 'news_state.dart';


class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial()) ;

  static NewsCubit get(context) => BlocProvider.of(context);


  News? news ;
  void getNews() {
    emit(GetAllNewsLoadingState());
    DioHelper.getData(
      url: newsEndPoint,
      token:accessToken,
    ).then((value) {
      print(value.statusMessage);
      news = News.fromJson(value.data);
      emit(GetAllNewsSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(GetAllNewsErrorState());
    });
  }

}