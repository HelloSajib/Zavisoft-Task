import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/decoration.dart';
import 'package:flutter_task/core/utils/ui_helpers/margins.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';
import 'package:flutter_task/widgets/network_image_widget.dart';
import 'package:flutter_task/widgets/ratings_widget.dart';

class ProductItemView extends HookWidget {
  final double price;
  final double? regularPrice;
  final int? discount;
  final bool? freeDelivery;
  final String imageUrl;
  final String productTitle;
  final double? productRating;
  final int? totalReview;

  const ProductItemView({
    super.key,
    this.freeDelivery,
    this.productRating,
    this.totalReview,
    this.regularPrice,
    this.discount,
    required this.price,
    required this.imageUrl,
    required this.productTitle,
  });


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: primaryDecoration,
          padding: padding12,
          child: Column(
            crossAxisAlignment: .start,
            children: [

              Container(
                width: 1.sw,
                height: 110.h,
                decoration: BoxDecoration(
                    color: AppColors.greyLight,
                    borderRadius: radius8
                ),
                child: NetworkImageWidget(
                    width: 1.sw,
                    borderRadius: radius8,
                    imageUrl: imageUrl
                ),
              ),

              gap6,

              Text(
                productTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.primary,
              ),

              RatingWidget(
                  rating: productRating ?? 0.0,
                  totalReviews: totalReview ?? 0
              ),

              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        "৳ ${price.toStringAsFixed(2)}",
                        style: AppTextStyles.primary,
                      ),
                      Text(
                        "৳ ${(regularPrice ?? 0).toStringAsFixed(2)}",
                        style: AppTextStyles.labelSmall.copyWith(
                            decoration: TextDecoration.lineThrough
                        ),
                      ),
                    ],
                  ),

                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )

                ],
              ),


            ],
          ),
        ),

        Positioned(
          top: 15,
          left: 15,
          child: InkWell(
            onTap: (){},
            child: Container(
              width: 35.w,
              height: 35.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_border,
                size: 20.sp,
              )
            ),
          ),
        )
      ],
    );
  }
}
