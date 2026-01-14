import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ecommerce_app/domain/products/models/product_model.dart';
import 'package:ecommerce_app/domain/core/failures/failures.dart';
import 'package:ecommerce_app/domain/products/repository/i_product_repository.dart';
import 'package:injectable/injectable.dart';

part 'product_details_state.dart';
part 'product_details_cubit.freezed.dart';

@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final IProductRepository _productRepository;

  ProductDetailsCubit(this._productRepository) : super(ProductDetailsState.initial());

  Future<void> getProductDetails(int id) async {
    emit(state.copyWith(
      isLoading: true,
      failureOption: none(),
    ));

    final result = await _productRepository.getProductDetails(id);

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        failureOption: some(failure),
      )),
      (product) => emit(state.copyWith(
        isLoading: false,
        product: product,
      )),
    );
  }

  Future<void> updateProduct(int id, Map<String, dynamic> data) async {
    emit(state.copyWith(
      isUpdateLoading: true,
      updateFailureOption: none(),
      isUpdateSuccess: false,
    ));

    final result = await _productRepository.updateProduct(id: id, data: data);

    result.fold(
      (failure) => emit(state.copyWith(
        isUpdateLoading: false,
        updateFailureOption: some(failure),
      )),
      (product) => emit(state.copyWith(
        isUpdateLoading: false,
        product: product,
        isUpdateSuccess: true,
      )),
    );
  }
}
