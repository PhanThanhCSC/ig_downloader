import 'package:flutter/material.dart';

import '../../customwidget/pull_to_refresh/pull_to_refresh.dart';
import '../base/mixin_base_page.dart';
import '../values/app_colors.dart';
import '/core/utils/debouncer.dart';
import '/core/values/app_values.dart';

///ignore: must_be_immutable
class PagingView extends StatelessWidget with BasePage {
  final Widget child;
  final Function() onLoadNextPage;
  final Future<void> Function()? onRefresh;

  RefreshController scrollController;

  PagingView({
    Key? key,
    required this.child,
    required this.onLoadNextPage,
    required this.onRefresh,
    required this.scrollController,
  });

/*  PagingView({
    Key? key,
    required this.child,
    required this.onLoadNextPage,
    required this.onRefresh,
    required this.scrollController,
  }) : super(key: key) {
    scrollController = RefreshController();
  }*/

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropMaterialHeader(
          backgroundColor: AppColors.bgColor,
          color: AppColors.colorPrimary,
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            return footerLoadMore(mode);
          },
        ),
        controller: scrollController,
        onRefresh: onRefresh,
        onLoading: onLoadNextPage,
        child: this.child);

    /*return NotificationListener(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollController != null) {
          var triggerFetchMoreSize = 0.75 * scrollController!.position.maxScrollExtent;

          if (scrollController!.position.pixels >= triggerFetchMoreSize && (scrollController!.position.userScrollDirection == ScrollDirection.reverse)) {
            _debouncer.run(() {
              onLoadNextPage();
            });
          }
        }

        return true;
      },
      child: onRefresh == null
          ? _getScrollableView()
          : RefreshIndicator(
              child: _getScrollableView(),
              onRefresh: onRefresh!,
            ),
    );*/
  }

/*  _getScrollableView() {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          child,
          const SizedBox(height: AppValues.listBottomEmptySpace),
        ],
      ),
    );
  }*/
}
