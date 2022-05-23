import 'package:flutter/material.dart';
import 'package:forestvpn_test/features/news/view/widgets/latest_news_item.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({Key? key, required this.listArticle}) : super(key: key);
  final List<Article> listArticle;

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return LatestNewsItem(
          article: widget.listArticle[index],
        );
      }, childCount: widget.listArticle.length),
    );
  }
}
