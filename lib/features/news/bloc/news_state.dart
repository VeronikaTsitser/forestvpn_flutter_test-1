import 'package:forestvpn_test/repositories/news/models/models.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class LoadingState extends NewsState {}

class Success extends NewsState {
  final List<Article> featuredNews;
  final List<Article> latestNews;

  Success(this.featuredNews, this.latestNews);
}

class Exception extends NewsState {
  final String exception;
  Exception(this.exception);
}
