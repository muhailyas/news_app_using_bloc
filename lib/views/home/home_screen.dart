import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/bloc/data_bloc/data_bloc_bloc.dart';
import 'package:news_app_bloc/utils/colors.dart';
import 'package:news_app_bloc/utils/constants.dart';
import 'package:news_app_bloc/views/detail/screen_details.dart';
import 'package:news_app_bloc/views/home/widgets/news_main_card_widget.dart';
import 'package:news_app_bloc/views/home/widgets/news_tile_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(FetchNewsEvent());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 8,
          title: const Text(
            'News',
            style: TextStyle(fontSize: 25, color: fontColorBlack),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<NewsBloc>().add(FetchNewsEvent());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                BlocBuilder<NewsBloc, NewsFromApi>(builder: (context, state) {
              if (state.isFetching) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: state.newsFromApi.length,
                itemBuilder: (context, index) {
                  return index == 0
                      ? InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScreenDetails(
                                    news: state.newsFromApi[index]),
                              )),
                          child: NewsMainCardWidget(
                            news: state.newsFromApi[0],
                          ),
                        )
                      : InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScreenDetails(
                                    news: state.newsFromApi[index]),
                              )),
                          child: NewsTileWidget(
                            news: state.newsFromApi[index],
                          ),
                        );
                },
                separatorBuilder: (context, index) => kheight10,
              );
            }),
          ),
        ),
      ),
    );
  }
}
