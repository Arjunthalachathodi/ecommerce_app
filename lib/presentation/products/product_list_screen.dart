import 'package:flutter/material.dart';
import 'package:ecommerce_app/application/core/theme/colors.dart';
import 'package:ecommerce_app/application/core/theme/text_styles.dart';
import 'package:ecommerce_app/application/products/cubit/product_cubit.dart';
import 'package:ecommerce_app/domain/products/models/product_model.dart';
import 'package:ecommerce_app/presentation/products/widgets/product_card_shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProductListScreen extends StatefulWidget {
  static const routeName = 'product-list';

  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductCubit>().getProducts(isRefresh: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.black87),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
          ),
        ],
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state.isLoading && state.products.isEmpty) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const ProductCardShimmer(),
                const Gap(20),
                const ProductCardShimmer(),
              ],
            );
          }

          if (state.failureOption.isSome() && state.products.isEmpty) {
            return Center(
              child: Text(
                state.failureOption.fold(() => '', (f) => f.map(
                  customError: (e) => e.errorMsg,
                  genericError: (e) => e.errorMsg,
                  serverError: (e) => e.errorMsg,
                )),
              ),
            );
          }


          final categories = <String, List<ProductModel>>{};
          for (var product in state.products) {
            if (!categories.containsKey(product.category)) {
              categories[product.category] = [];
            }
            categories[product.category]!.add(product);
          }

          return RefreshIndicator(
            onRefresh: () => context.read<ProductCubit>().getProducts(isRefresh: true),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                const Gap(10),
                Text(
                  'Discover our exclusive\nproducts',
                  style: context.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                    height: 1.2,
                  ),
                ),
                const Gap(12),
                Text(
                  'In this marketplace, you will find various\nladders in the cheapest price',
                  style: context.bodyMedium?.copyWith(
                    color: Colors.black45,
                    height: 1.5,
                  ),
                ),
                const Gap(30),

                ...categories.entries.map((entry) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatCategoryName(entry.key),
                            style: context.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                'category-products',
                                arguments: {
                                  'categoryName': entry.key,
                                  'products': entry.value,
                                },
                              );
                            },
                            child: Text(
                              'Show All',
                              style: context.bodyMedium?.copyWith(
                                color: const Color(0xFF5B61EB),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(16),
                      SizedBox(
                        height: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: entry.value.length,
                          itemBuilder: (context, index) {
                            final product = entry.value[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                right: index < entry.value.length - 1 ? 16 : 0,
                              ),
                              child: _HorizontalProductCard(
                                product: product,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    'product-details',
                                    arguments: product.id,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      const Gap(30),
                    ],
                  );
                }).toList(),
                if (state.isLoading)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                const Gap(20),
              ],
            ),
          );
        },
      ),
    );
  }

  String _formatCategoryName(String category) {

    if (category.isEmpty) return category;
    return category[0].toUpperCase() + category.substring(1);
  }
}

class _HorizontalProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const _HorizontalProductCard({
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Container(
                    height: 160,
                    width: 160,
                    color: const Color(0xFFF8F8F8),
                    child: Image.network(
                      product.thumbnail,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Center(
                        child: Icon(Icons.image_not_supported, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.favorite_border,
                      size: 18,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    product.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.black45,
                      height: 1.3,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    '\$ ${product.price}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
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
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
}
