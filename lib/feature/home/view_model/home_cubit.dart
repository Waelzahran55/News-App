import 'package:bloc/bloc.dart';


import '../../../core/network/resulet_api.dart';
import '../data/api/news_api.dart';
import '../data/models/news_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Articles> articles = [];
  String errorMasseg = "";

  Future<void> getNews() async {
    emit(Homeloading());
    final resulet = await NewsApi.getNews();
    switch (resulet) {
      case Success<NewsModel>():
        articles = resulet.data.articles ?? [];
        emit(HomeSuccess());
      case Error<NewsModel>():
        errorMasseg = resulet.error;
        emit(HomeError(errorMasseg));
    }
  }
}
