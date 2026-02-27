import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/features/home/presentation/widgets/sections/carousel_section.dart';
import 'package:flutter_task/features/home/presentation/widgets/tab_views/product_tab_view.dart';
import 'package:flutter_task/widgets/app_bar/primary_app_bar.dart';

class HomePage extends HookWidget {

  static String get path => "/home";
  static String get name => "home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final tabController = useTabController(initialLength: 3);
    const categories = ["All", "Fashion", "Electronics"];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
              PrimaryAppBar(),
              Expanded(
                child: ExtendedNestedScrollView(
                  onlyOneScrollInBody: true,
                  headerSliverBuilder: (context, innerBoxIsScrolled){
                    return [
                      SliverToBoxAdapter(
                        child: CarouselSection(),
                      ),
                      SliverPersistentHeader(
                          pinned: true,
                          delegate: _TabBarDelegate(
                            TabBar(
                              controller: tabController,
                              labelColor: Colors.blue,
                              indicatorColor: Colors.blue,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorWeight: 2.0,
                              unselectedLabelColor: Colors.grey,
                              tabs: categories.map((category) {
                                return Tab(text: category);
                              }).toList(),
                            ),
                          )
                      )
                    ];
                  },
                  body: TabBarView(
                    controller: tabController,
                    children: categories.map((category){
                      return ProductTabView(category: category);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      color: Colors.white,
      elevation: overlapsContent ? 2 : 0,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) =>
      tabBar != oldDelegate.tabBar;
}
