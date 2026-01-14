import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/application/core/serveice/dio_client.dart';
import 'package:ecommerce_app/application/core/utils/urls.dart';
import 'package:ecommerce_app/domain/core/failures/failures.dart';
import 'package:ecommerce_app/domain/products/models/product_model.dart';
import 'package:ecommerce_app/domain/products/repository/i_product_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IProductRepository)
class ProductRepositoryImpl implements IProductRepository {
  final DioClient _dioClient;

  ProductRepositoryImpl(this._dioClient);

  @override
  Future<Either<MainFailure, ProductListResponse>> getProducts({
    int limit = 30,
    int skip = 0,
  }) async {
    try {
      final response = await _dioClient.get(
        Urls.products,
        queryParameters: {
          'limit': limit,
          'skip': skip,
        },
      );

      if (response.statusCode == 200) {
        return Right(ProductListResponse.fromJson(response.data));
      } else {
        return const Left(
          MainFailure.serverError(errorMsg: 'Failed to fetch products'),
        );
      }
    } catch (e) {
      return Left(MainFailure.customError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, ProductModel>> getProductDetails(int id) async {
    try {
      final response = await _dioClient.get('${Urls.productDetails}$id');

      if (response.statusCode == 200) {
        return Right(ProductModel.fromJson(response.data));
      } else {
        return const Left(
          MainFailure.serverError(errorMsg: 'Failed to fetch product details'),
        );
      }
    } catch (e) {
      return Left(MainFailure.customError(errorMsg: e.toString()));
    }
  }

  @override
  Future<Either<MainFailure, ProductModel>> updateProduct({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dioClient.put(
        '${Urls.productDetails}$id',
        data: data,
      );

      if (response.statusCode == 200) {
        return Right(ProductModel.fromJson(response.data));
      } else {
        return const Left(
          MainFailure.serverError(errorMsg: 'Failed to update product'),
        );
      }
    } catch (e) {
      return Left(MainFailure.customError(errorMsg: e.toString()));
    }
  }
}
