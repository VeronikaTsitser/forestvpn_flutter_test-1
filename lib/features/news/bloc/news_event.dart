import 'package:forestvpn_test/repositories/news/models/article.dart';

abstract class NewsEvent {}

class LoadNews extends NewsEvent {}

class UpdateNews extends NewsEvent {
  final List<Article> latestArticles;
  final List<Article> featuredArticles;

  final Article article;
  UpdateNews(
      {required this.latestArticles,
      required this.article,
      required this.featuredArticles});
}

class ReadAll extends NewsEvent {
  final List<Article> latestArticles;
  final List<Article> featuredArticles;

  ReadAll({required this.latestArticles, required this.featuredArticles});
}
