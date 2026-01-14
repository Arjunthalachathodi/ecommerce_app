import 'package:flutter/material.dart';
import 'package:ecommerce_app/application/core/theme/colors.dart';
import 'package:ecommerce_app/application/core/theme/text_styles.dart';
import 'package:ecommerce_app/domain/products/models/product_model.dart';
import 'package:ecommerce_app/presentation/core/widgets/custom_shimmer.dart';
import 'package:gap/gap.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: ColorResources.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: ColorResources.pureBlack.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.network(
                      product.thumbnail,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const CustomShimmer(
                          width: double.infinity,
                          height: double.infinity,
                        );
                      },
                      errorBuilder: (context, error, stackTrace) => const Center(
                        child: Icon(Icons.image_not_supported),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: ColorResources.white,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(
                        Icons.favorite_border,
                        size: 18,
                        color: ColorResources.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.bodyLarge?.w600.deepMaroon,
                  ),
                  const Gap(4),
                  Text(
                    product.category,
                    style: context.labelSmall?.w400.softGray,
                  ),
                  const Gap(8),
                  Text(
                    '\$${product.price}',
                    style: context.bodyLarge?.w700.oceanBlue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on BuildContext {
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
}
