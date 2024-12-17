import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProductCardLoading extends StatelessWidget {
  const ProductCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 350,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(15),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              width: 80,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    ).animate(
      onPlay: (controller) {
        controller.repeat();
      },
    ).shimmer(duration: const Duration(seconds: 2));
  }
}
