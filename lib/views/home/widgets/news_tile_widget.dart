import 'package:flutter/material.dart';
import 'package:news_app_bloc/models/news_model.dart';
import '../../../utils/constants.dart';

class NewsTileWidget extends StatelessWidget {
  const NewsTileWidget({super.key, required this.news});
  final News news;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Row(
        children: [
          SizedBox(
            height: 90,
            width: 320,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: const BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                    ),
                    Text(
                      '   ${news.publishedAt.substring(1, 10)}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  news.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          ),
          kwidth10,
          Container(
            decoration: BoxDecoration(
                borderRadius: borderRadius10,
                image: DecorationImage(
                    image: NetworkImage(news.urlToImage), fit: BoxFit.cover)),
            height: 90,
            width: 106,
          ),
        ],
      ),
    );
  }
}
