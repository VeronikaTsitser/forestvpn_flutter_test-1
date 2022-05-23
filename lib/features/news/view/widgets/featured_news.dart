import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';

import 'featured_news_items.dart';

class FeaturedNews extends StatelessWidget {
  const FeaturedNews({Key? key, required this.listArticle}) : super(key: key);
  final List<Article> listArticle;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return FeaturedNewsItem(
          article: listArticle[index],
        );
      },
    );
  }
}
