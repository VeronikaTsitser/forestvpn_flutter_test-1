import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/features/news/bloc/news_event.dart';
import 'package:forestvpn_test/repositories/news/abstract_news_repository.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final AbstractNewsRepository repository;
  NewsBloc(this.repository) : super(NewsInitial()) {
    on<LoadNews>((event, emit) async {
      emit(LoadingState());
      try {
        final featuredArticles = await repository.getLatestArticles();
        final latestArticles = await repository.getLatestArticles();
        emit(Success(featuredArticles, latestArticles));
      } catch (e) {
        emit(Exception(e.toString()));
      }
    });
    on<UpdateNews>((event, emit) async {
      emit(LoadingState());
      try {
        final currentList = event.latestArticles;
        final currentArticle = event.article;
        final currentArticleId = currentList.indexOf(currentArticle);

        currentList.remove(currentArticle);
        final updatedArticle = Article(
            id: currentArticle.id,
            title: currentArticle.title,
            publicationDate: currentArticle.publicationDate,
            imageUrl: currentArticle.imageUrl,
            readed: true,
            description: currentArticle.description);
        currentList.insert(currentArticleId, updatedArticle);
        emit(Success(event.featuredArticles, currentList));
      } catch (e) {
        emit(Exception(e.toString()));
      }
    });
    on<ReadAll>((event, emit) async {
      emit(LoadingState());
      try {
        final currentList = event.latestArticles;
        List<Article> newList = [];
        currentList.forEach((element) {
          final updatedArticle = Article(
              id: element.id,
              title: element.title,
              publicationDate: element.publicationDate,
              imageUrl: element.imageUrl,
              readed: true,
              description: element.description);
          newList.add(updatedArticle);
        });

        emit(Success(event.featuredArticles, newList));
      } catch (e) {
        emit(Exception(e.toString()));
      }
    });
  }
}
