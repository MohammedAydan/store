import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/constants/images_constants.dart';
import 'package:store_app/modules/home/views/widgets/product_list.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          FlutterCarousel(
            options: FlutterCarouselOptions(
              height: 200,
              showIndicator: true,
              slideIndicator: CircularSlideIndicator(),
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return SvgPicture.asset(ImagesConstants.img1);
                },
              );
            }).toList(),
          ),
          const ProductList(),
        ],
      ),
    );
  }
}
