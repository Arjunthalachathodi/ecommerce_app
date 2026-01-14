import 'package:flutter/material.dart';
import 'package:ecommerce_app/presentation/core/widgets/custom_shimmer.dart';
import 'package:gap/gap.dart';

class HomepageShimmer extends StatelessWidget {
  const HomepageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const Gap(10),
        // Hero Title Placeholders
        const CustomShimmer(width: 250, height: 32, borderRadius: BorderRadius.all(Radius.circular(8))),
        const Gap(8),
        const CustomShimmer(width: 180, height: 32, borderRadius: BorderRadius.all(Radius.circular(8))),
        const Gap(12),
        // Subtitle Placeholders
        const CustomShimmer(width: 280, height: 16, borderRadius: BorderRadius.all(Radius.circular(4))),
        const Gap(6),
        const CustomShimmer(width: 200, height: 16, borderRadius: BorderRadius.all(Radius.circular(4))),
        
        const Gap(30),

        // Category Section Shimmers
        _buildCategoryShimmer(),
        const Gap(24),
        _buildCategoryShimmer(),
      ],
    );
  }

  Widget _buildCategoryShimmer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CustomShimmer(width: 120, height: 24, borderRadius: BorderRadius.all(Radius.circular(6))),
            CustomShimmer(width: 60, height: 16, borderRadius: BorderRadius.all(Radius.circular(4))),
          ],
        ),
        const Gap(16),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                width: 180,
                margin: const EdgeInsets.only(right: 16),
                child: const ProductCardShimmer(),
              );
            },
          ),
        ),
      ],
    );
  }
}

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
          // Image placeholder
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
              children: [
                // Title placeholder
                const CustomShimmer(width: 100, height: 16, borderRadius: BorderRadius.all(Radius.circular(4))),
                const Gap(8),
                // Description lines
                const CustomShimmer(width: 140, height: 10, borderRadius: BorderRadius.all(Radius.circular(3))),
                const Gap(4),
                const CustomShimmer(width: 120, height: 10, borderRadius: BorderRadius.all(Radius.circular(3))),
                const Gap(12),
                // Price placeholder
                const CustomShimmer(width: 60, height: 18, borderRadius: BorderRadius.all(Radius.circular(4))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
