import 'package:bloc/bloc.dart';
import 'package:news_app_bloc/api/api_service.dart';
import 'package:news_app_bloc/models/news_model.dart';
part 'data_bloc_event.dart';
part 'data_bloc_state.dart';

class NewsBloc extends Bloc<FetchNewsEvent, NewsFromApi> {
  NewsBloc() : super(NewsFromApiInitial()) {
    on<FetchNewsEvent>((event, emit) async {
      emit(NewsFromApi(newsFromApi: [], isFetching: true));
      final news = await ApiServices().getNewsFromServer();
      return emit(NewsFromApi(newsFromApi: news, isFetching: false));
    });
  }
}
