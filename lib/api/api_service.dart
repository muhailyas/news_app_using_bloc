import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:news_app_bloc/models/news_model.dart';

class ApiServices {
  ApiServices._();
  static final ApiServices instance = ApiServices._();
  factory ApiServices() => instance;

  Future<List<News>> getNewsFromServer() async {
    String url =
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=97a7829eb0ea466eb24be817ccbcd5ba";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final resultList = responseBody['articles'] as List;
        return resultList.map((news) => News.fromJson(news)).toList();
      } else {
        log('response error');
      }
      return [];
    } catch (e) {
      log('fetching error');
      return [];
    }
  }
}
