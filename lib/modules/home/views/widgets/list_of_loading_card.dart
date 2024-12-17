import 'package:flutter/material.dart';
import 'package:store_app/modules/home/views/widgets/product_card_loading.dart';

class ListOfLoadingCard extends StatelessWidget {
  const ListOfLoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 9 / 15,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) => const ProductCardLoading(),
    );
  }
}
