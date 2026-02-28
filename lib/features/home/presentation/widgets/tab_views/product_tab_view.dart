import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/extensions/null_empty_extension.dart';
import 'package:flutter_task/core/utils/extensions/status_extension.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_task/features/home/presentation/bloc/home_event.dart';
import 'package:flutter_task/widgets/circle_loading_widget.dart';
import 'package:flutter_task/widgets/empty_widget.dart';
import 'package:flutter_task/widgets/error_widget/error_widget.dart';
import 'package:flutter_task/widgets/item_view/product_item_view.dart';

class ProductTabView extends StatefulHookWidget {
  final String category;

  const ProductTabView({
    super.key,
    required this.category
  });

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    void getProducts(){
      context.read<HomeBloc>().add(GetProducts());
    }

    useEffect(() {
      Future.microtask(() => getProducts());
      return null;
    }, []);

    return RefreshIndicator(
      onRefresh: () async => getProducts(),
      color: AppColors.primary,
      child: Padding(
        padding: padding12,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {

            if(state.status.isLoading){
              return CircleLoadingWidget();
            }else if(state.status.isSuccess){

              if(state.products.isNotNullAndNotEmpty){

                return CustomScrollView(
                  key: PageStorageKey<String>(widget.category),
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverGrid(
                      gridDelegate: _gridDelegate,
                      delegate: SliverChildBuilderDelegate(
                        childCount: 15,
                        (context, index) {
                          final product = state.products![index];
                          return ProductItemView(
                            price: product.price ?? 0,
                            regularPrice: product.price ?? 0,
                            imageUrl: product.image ?? "",
                            productTitle: product.title ?? "",
                            productRating: product.rating?.rate ?? 0,
                            totalReview: product.rating?.count ?? 0,
                          );
                        },
                      ),
                    ),
                  ],
                );

              }else{
                return EmptyWidget(
                    title: "No Products Found",
                    description: "No products found in this category"
                );
              }

            }else if(state.status.isLoading){
              return ApiErrorWidget(
                errorMessage: state.message ?? "Something went wrong",
                onRetry: getProducts
              );
            }else{
              return SizedBox.shrink();
            }

          },
        ),
      ),
    );
  }
  final _gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 12.w,
    crossAxisSpacing: 12.w,
    childAspectRatio: 0.65,
  );
}
