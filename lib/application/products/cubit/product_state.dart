part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    required bool isLoading,
    required List<ProductModel> products,
    required Option<MainFailure> failureOption,
    required bool hasReachedMax,
    required int skip,
  }) = _ProductState;

  factory ProductState.initial() => ProductState(
        isLoading: false,
        products: [],
        failureOption: none(),
        hasReachedMax: false,
        skip: 0,
      );
}
