import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/features/news/bloc/news_bloc.dart';
import 'package:forestvpn_test/features/news/bloc/news_event.dart';
import 'package:forestvpn_test/features/news/bloc/news_state.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

class LatestNewsItem extends StatelessWidget {
  const LatestNewsItem({Key? key, required this.article}) : super(key: key);
  final Article article;
  String _daysAgo(DateTime publicationDate) {
    Duration someText;
    someText = DateTime.now().difference(publicationDate);
    if (someText.inDays == 1) {
      return someText.inDays.toString() + " day ago";
    } else {
      return someText.inDays.toString() + " days ago";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final bloc = BlocProvider.of<NewsBloc>(context);
        if (bloc.state is Success) {
          final state = bloc.state as Success;
          final latestNews = state.latestNews;
          final featuredNews = state.featuredNews;
          bloc.add(UpdateNews(
              latestArticles: latestNews,
              article: article,
              featuredArticles: featuredNews));
        }

        Navigator.pushNamed(context, '/news_details', arguments: article);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(255, 255, 255, 1),
                blurRadius: 8,
                offset: Offset(-4, -4),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              // color: Color.fromRGBO(255, 255, 255, 1),
              color: (article.readed)
                  ? const Color.fromRGBO(245, 245, 245, 1)
                  : const Color.fromRGBO(255, 255, 255, 1),
              borderRadius: const BorderRadius.all(Radius.circular(9.0)),
              boxShadow: [
                BoxShadow(
                  color: (article.readed)
                      ? const Color.fromRGBO(0, 0, 0, 0.07)
                      : const Color.fromRGBO(0, 0, 0, 0.1),
                  blurRadius: 20,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            height: 103,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 20, bottom: 23, right: 23),
                  child: Image(
                    image: NetworkImage(
                      article.imageUrl,
                    ),
                    height: 60,
                    width: 90,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20, bottom: 20, right: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 160,
                        child: Text(
                          article.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 16, fontFamily: 'SFProDisplay'),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 150,
                        child: Text(
                          _daysAgo(article.publicationDate),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'SFProDisplay',
                            color: Color.fromRGBO(154, 154, 154, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
