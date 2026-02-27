import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/widgets/item_view/product_item_view.dart';

class ProductTabView extends StatefulHookWidget{
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return RefreshIndicator(
      onRefresh: () async {},
      color: Colors.orange.shade700,
      backgroundColor: Colors.white,
      child: Padding(
        padding: padding12,
        child: CustomScrollView(
          //key: PageStorageKey<String>("scroll_${widget.tabId}"),
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.w,
                crossAxisSpacing: 12.w,
                childAspectRatio: 0.65,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: 15,
                (context, index) {
                  return ProductItemView(
                      price: 235,
                      imageUrl: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_t.png",
                      productTitle: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday"
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
