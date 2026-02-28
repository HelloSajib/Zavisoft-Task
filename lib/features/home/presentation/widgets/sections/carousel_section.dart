import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSection extends HookWidget {

  const CarouselSection({super.key});

  @override
  Widget build(BuildContext context) {

    final activeIndex = useState(0);
    final carouselController = useMemoized(() => CarouselSliderController());

    const carousels = [
      "assets/dummy/carousel_img_1.png",
      "assets/dummy/carousel_img_2.png",
      "assets/dummy/carousel_img_1.png",
    ];


    return Padding(
      padding: paddingH16,
      child: Column(
        crossAxisAlignment: .center,
        children: [
          ClipRRect(
            borderRadius: radius12,
            child: CarouselSlider.builder(
              carouselController: carouselController,
              itemCount: carousels.length,
              options: CarouselOptions(
                height: 150.h,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) => activeIndex.value = index,
              ),
              itemBuilder: (context, index, realIndex) {
                return Image.asset(
                  carousels[index],
                  width: 1.sw,
                  fit: .cover,
                );
              },
            ),
          ),

          gap12,

          AnimatedSmoothIndicator(
            activeIndex: activeIndex.value,
            count: carousels.length,
            effect: ExpandingDotsEffect(
              expansionFactor: 4,
              dotWidth: 6.h,
              dotHeight: 6.h,
              spacing: 6,
              paintStyle: PaintingStyle.fill,
              strokeWidth: 1.5,
              dotColor: AppColors.greyLight,
              activeDotColor: AppColors.primary,
            ),
            onDotClicked: (index) => carouselController.animateToPage(index),
          ),
        ],
      ),
    );
  }
}
