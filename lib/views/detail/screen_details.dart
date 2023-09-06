import 'package:flutter/material.dart';
import 'package:news_app_bloc/controllers/redirection_controller.dart';
import 'package:news_app_bloc/models/news_model.dart';
import 'package:news_app_bloc/utils/colors.dart';
import 'package:news_app_bloc/utils/constants.dart';

class ScreenDetails extends StatelessWidget {
  const ScreenDetails({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 370,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(news.urlToImage), fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    style: const TextStyle(color: fontColorBlack, fontSize: 25),
                  ),
                  kheight10,
                  Text(
                    news.description,
                    style: const TextStyle(color: fontColorBlack, fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),
                  kheight10,
                  InkWell(
                    onTap: () {
                      redirectingUrl(news.url);
                    },
                    child: const Text(
                      "Tap for more ",
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
