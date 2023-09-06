part of 'data_bloc_bloc.dart';

class NewsFromApi {
  final List<News> newsFromApi;
  final bool isFetching;
  NewsFromApi({required this.newsFromApi, this.isFetching = false});
}

final class NewsFromApiInitial extends NewsFromApi {
  NewsFromApiInitial() : super(newsFromApi: []);
}
