import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/core/failures/failures.dart';
import 'package:ecommerce_app/domain/products/models/product_model.dart';

abstract class IProductRepository {
  Future<Either<MainFailure, ProductListResponse>> getProducts({
    int limit = 30,
    int skip = 0,
  });

  Future<Either<MainFailure, ProductModel>> getProductDetails(int id);

  Future<Either<MainFailure, ProductModel>> updateProduct({
    required int id,
    required Map<String, dynamic> data,
  });
}
