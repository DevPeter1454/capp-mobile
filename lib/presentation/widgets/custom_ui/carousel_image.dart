
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:capp/core/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ItemDetailImageCarouselWidget extends StatelessWidget {
  const ItemDetailImageCarouselWidget(
      {Key? key, this.itemImgList, this.onPageChanged, this.selectedImgIndex})
      : super(key: key);
  final List<String>? itemImgList;
  final ValueChanged? onPageChanged;
  final int? selectedImgIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.transparent),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.7,

                  // aspectRatio: 16 / 14,
                  initialPage: 1,
                  // viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    onPageChanged!(index);
                  },
                  scrollDirection: Axis.horizontal,
                ),
                items: itemImgList!
                    .asMap()
                    .entries
                    .map(
                      (e) => ItemImage(imageUrl: e.value, tag: 'tag'),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: itemImgList!
                    .asMap()
                    .entries
                    .map(
                      (e) => InkWell(
                        onTap: (){

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image(
                              width:40,
                              height: 40,
                              image: NetworkImage( e.value,)),
                        ),
                      ),
                )
                    .toList(),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              child: AnimatedSmoothIndicator(
                activeIndex: selectedImgIndex!,
                count: itemImgList!.length,
                // count: 2,
                effect: ExpandingDotsEffect(
                  dotHeight: 7,
                  radius: 10,
                  dotWidth: 7,
                  activeDotColor: AppColors.appGrey,
                  dotColor: AppColors.appGrey.withOpacity(.3),
                  expansionFactor: 6,
                ),
              ),
            ),
          ],
        ));
  }
}

class ItemImage extends StatelessWidget {
  const ItemImage({
    Key? key,
    this.imageUrl,
    this.tag,
  }) : super(key: key);
  final String? imageUrl, tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.circular(16),
        color: Colors.transparent
      ),
      child: Container(
        child: Image(
          image: NetworkImage(
            imageUrl!,
          ),
          width: 80.0,
          height: 140,
          // fit: BoxFit.cover,
        ),
      ),
    );
  }
}
