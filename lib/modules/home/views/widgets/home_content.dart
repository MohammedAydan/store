import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:store_app/modules/home/controllers/home_controller.dart';
import 'package:store_app/modules/home/views/widgets/product_list.dart';

class HomeContent extends GetView<HomeController> {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Obx(() {
            if (controller.isLoading.isTrue) {
              return Animate(
                onPlay: (controller) {
                  controller.repeat();
                },
                effects: const [
                  ShimmerEffect(duration: Duration(seconds: 1)),
                ],
                child: Container(
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              );
            } else if (controller.error.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Card.filled(
                  color: Get.theme.colorScheme.error,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(controller.error.value),
                  ),
                ),
              );
            } else if (controller.initialCards.isEmpty) {
              return const SizedBox();
            } else {
              return FlutterCarousel(
                options: FlutterCarouselOptions(
                  height: 200,
                  showIndicator: true,
                  slideIndicator: CircularSlideIndicator(),
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 600),
                ),
                items: controller.initialCards.map((i) {
                  return GestureDetector(
                    onTap: () => controller.getRoute(i),
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(i.image),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          }),
          const ProductList(),
        ],
      ),
    );
  }
}
