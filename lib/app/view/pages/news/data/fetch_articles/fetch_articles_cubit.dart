import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tradings/app/view/pages/news/data/provider/fetch_articles_provider.dart';

import '../models/article_model.dart';

part 'fetch_articles_state.dart';
part 'fetch_articles_cubit.freezed.dart';

class FetchArticlesCubit extends Cubit<FetchArticlesState> {
  FetchArticlesCubit() : super(FetchArticlesState.init());

  Future<void> fetchArticlesWithStates() async {
    emit(FetchArticlesState.prgrs());
    try {
      final articles =
          await FetchArticlesProvider.fetchNewsByCategoryFromServer();
      emit(FetchArticlesState.scss(articles));
    } catch (e) {
      emit(FetchArticlesState.fld(e.toString()));
    }
  }
}
