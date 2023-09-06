import 'package:flutter/material.dart';
import 'package:news_app_bloc/models/news_model.dart';
import 'package:news_app_bloc/utils/colors.dart';
import '../../../utils/constants.dart';

class NewsMainCardWidget extends StatelessWidget {
  const NewsMainCardWidget({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: borderRadius10,
            image: DecorationImage(
                image: NetworkImage(news.urlToImage), fit: BoxFit.cover),
          ),
        ),
        kheight10,
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                news.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: fontColorBlack),
              ),
              kheight10,
              Text(
                news.description,
                textAlign: TextAlign.justify,
                maxLines: 3,
                style: const TextStyle(color: smallFontColorGrey),
              ),
              kheight20
            ],
          ),
        ),
        kheight10
      ],
    );
  }
}
