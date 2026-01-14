part of 'product_details_cubit.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    required bool isLoading,
    required bool isUpdateLoading,
    required bool isUpdateSuccess,
    ProductModel? product,
    required Option<MainFailure> failureOption,
    required Option<MainFailure> updateFailureOption,
  }) = _ProductDetailsState;

  factory ProductDetailsState.initial() => ProductDetailsState(
        isLoading: false,
        isUpdateLoading: false,
        isUpdateSuccess: false,
        failureOption: none(),
        updateFailureOption: none(),
      );
}
