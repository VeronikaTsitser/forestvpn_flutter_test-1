import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/features/news/bloc/news_bloc.dart';
import 'package:forestvpn_test/features/news/bloc/news_event.dart';
import 'package:forestvpn_test/features/news/view/widgets/featured_news.dart';

import '../../bloc/news_state.dart';
import '../widgets/latest_news.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsInitial) {
            return Container();
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is Success) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 43,
                          bottom: 20,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back_ios_new),
                              padding: EdgeInsets.zero,
                            ),
                            const SizedBox(
                              width: 95,
                            ),
                            const Text(
                              'Notifications',
                              style: TextStyle(
                                  fontFamily: 'SFProDisplay',
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                final bloc = BlocProvider.of<NewsBloc>(context);
                                bloc.add(ReadAll(
                                    latestArticles: state.latestNews,
                                    featuredArticles: state.featuredNews));
                              },
                              child: const Text(
                                'Mask all read',
                                style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 28, bottom: 10),
                            child: Text(
                              'Featured',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'SFProDisplay',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        child: FeaturedNews(
                          listArticle: state.featuredNews,
                        ),
                        height: 300,
                        width: 358,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 28, top: 20, bottom: 10),
                        child: Text(
                          'Latest news',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'SFProDisplay',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                LatestNews(
                  listArticle: state.latestNews,
                ),
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
