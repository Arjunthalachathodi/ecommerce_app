import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecommerce_app/domain/products/models/product_model.dart';
import 'package:ecommerce_app/domain/core/failures/failures.dart';
import 'package:ecommerce_app/domain/products/repository/i_product_repository.dart';
import 'package:injectable/injectable.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  final IProductRepository _productRepository;

  ProductCubit(this._productRepository) : super(ProductState.initial());

  Future<void> getProducts({bool isRefresh = false}) async {
    if (state.isLoading || (state.hasReachedMax && !isRefresh)) return;

    emit(state.copyWith(
      isLoading: true,
      failureOption: none(),
      skip: isRefresh ? 0 : state.skip,
      products: isRefresh ? [] : state.products,
    ));

    final result = await _productRepository.getProducts(
      skip: state.skip,
      limit: 20,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        failureOption: some(failure),
      )),
      (response) {
        final newProducts = isRefresh
            ? response.products
            : [...state.products, ...response.products];
        
        emit(state.copyWith(
          isLoading: false,
          products: newProducts,
          skip: state.skip + response.products.length,
          hasReachedMax: response.products.length < 20 || state.skip + response.products.length >= response.total,
        ));
      },
    );
  }
}
