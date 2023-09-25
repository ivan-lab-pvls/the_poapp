part of 'fetch_articles_cubit.dart';

@freezed
class FetchArticlesState with _$FetchArticlesState {
  const factory FetchArticlesState.init() = _Init;
  const factory FetchArticlesState.prgrs() = _Prgrs;
  const factory FetchArticlesState.scss(List<ArticleModel> articles) = _Scss;
  const factory FetchArticlesState.fld(String error) = _Fld;
}
