import 'package:flutter/material.dart';
import 'package:ecommerce_app/presentation/core/widgets/custom_shimmer.dart';
import 'package:gap/gap.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: CustomShimmer(
              width: double.infinity,
              height: double.infinity,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomShimmer(width: 100, height: 16, borderRadius: BorderRadius.all(Radius.circular(4))),
                Gap(4),
                CustomShimmer(width: 60, height: 12, borderRadius: BorderRadius.all(Radius.circular(4))),
                Gap(8),
                CustomShimmer(width: 40, height: 16, borderRadius: BorderRadius.all(Radius.circular(4))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
