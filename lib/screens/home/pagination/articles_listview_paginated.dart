import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:united_mania_flutter/models/data.dart';
import 'package:united_mania_flutter/screens/home/home_service.dart';
import 'package:united_mania_flutter/screens/home/pagination/paging_first_page_error_indicator.dart';
import 'package:united_mania_flutter/screens/home/pagination/paging_new_page_error.dart';
import 'article_list_item.dart';

class ArticlesPagination extends StatefulWidget {

  final HomeService _service = Get.put(HomeService());

  @override
  _ArticlesListViewState createState() => _ArticlesListViewState();
}

class _ArticlesListViewState extends State<ArticlesPagination> {
  static const pageSize = 5;

  final PagingController<int, Article> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int page) async {
    try {
      List<Article> articles = await widget._service.fetchArticles(pageSize, page);
      page = page + 1;
      _pagingController.appendPage(articles, page);
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) => PagedListView<int, Article>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Article>(
          itemBuilder: (context, item, index) => ArticleListItem(article: item),
          firstPageErrorIndicatorBuilder: (_) => FirstPageErrorIndicator(
            onTryAgain: () => _pagingController.refresh(),
          ),
          newPageErrorIndicatorBuilder: (_) => NewPageErrorIndicator(
            onTryAgain: () => _pagingController.retryLastFailedRequest(),
          ),
          noMoreItemsIndicatorBuilder: (_) => Padding(
            padding: EdgeInsets.all(8),
            child: Text("That's it :)"),
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
