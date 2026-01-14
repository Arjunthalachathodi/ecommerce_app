// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdateLoading => throw _privateConstructorUsedError;
  bool get isUpdateSuccess => throw _privateConstructorUsedError;
  ProductModel? get product => throw _privateConstructorUsedError;
  Option<MainFailure> get failureOption => throw _privateConstructorUsedError;
  Option<MainFailure> get updateFailureOption =>
      throw _privateConstructorUsedError;

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductDetailsStateCopyWith<ProductDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsStateCopyWith<$Res> {
  factory $ProductDetailsStateCopyWith(
          ProductDetailsState value, $Res Function(ProductDetailsState) then) =
      _$ProductDetailsStateCopyWithImpl<$Res, ProductDetailsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdateLoading,
      bool isUpdateSuccess,
      ProductModel? product,
      Option<MainFailure> failureOption,
      Option<MainFailure> updateFailureOption});

  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class _$ProductDetailsStateCopyWithImpl<$Res, $Val extends ProductDetailsState>
    implements $ProductDetailsStateCopyWith<$Res> {
  _$ProductDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdateLoading = null,
    Object? isUpdateSuccess = null,
    Object? product = freezed,
    Object? failureOption = null,
    Object? updateFailureOption = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateLoading: null == isUpdateLoading
          ? _value.isUpdateLoading
          : isUpdateLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateSuccess: null == isUpdateSuccess
          ? _value.isUpdateSuccess
          : isUpdateSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
      failureOption: null == failureOption
          ? _value.failureOption
          : failureOption // ignore: cast_nullable_to_non_nullable
              as Option<MainFailure>,
      updateFailureOption: null == updateFailureOption
          ? _value.updateFailureOption
          : updateFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<MainFailure>,
    ) as $Val);
  }

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductDetailsStateImplCopyWith<$Res>
    implements $ProductDetailsStateCopyWith<$Res> {
  factory _$$ProductDetailsStateImplCopyWith(_$ProductDetailsStateImpl value,
          $Res Function(_$ProductDetailsStateImpl) then) =
      __$$ProductDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isUpdateLoading,
      bool isUpdateSuccess,
      ProductModel? product,
      Option<MainFailure> failureOption,
      Option<MainFailure> updateFailureOption});

  @override
  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$$ProductDetailsStateImplCopyWithImpl<$Res>
    extends _$ProductDetailsStateCopyWithImpl<$Res, _$ProductDetailsStateImpl>
    implements _$$ProductDetailsStateImplCopyWith<$Res> {
  __$$ProductDetailsStateImplCopyWithImpl(_$ProductDetailsStateImpl _value,
      $Res Function(_$ProductDetailsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isUpdateLoading = null,
    Object? isUpdateSuccess = null,
    Object? product = freezed,
    Object? failureOption = null,
    Object? updateFailureOption = null,
  }) {
    return _then(_$ProductDetailsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateLoading: null == isUpdateLoading
          ? _value.isUpdateLoading
          : isUpdateLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateSuccess: null == isUpdateSuccess
          ? _value.isUpdateSuccess
          : isUpdateSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
      failureOption: null == failureOption
          ? _value.failureOption
          : failureOption // ignore: cast_nullable_to_non_nullable
              as Option<MainFailure>,
      updateFailureOption: null == updateFailureOption
          ? _value.updateFailureOption
          : updateFailureOption // ignore: cast_nullable_to_non_nullable
              as Option<MainFailure>,
    ));
  }
}

/// @nodoc

class _$ProductDetailsStateImpl implements _ProductDetailsState {
  const _$ProductDetailsStateImpl(
      {required this.isLoading,
      required this.isUpdateLoading,
      required this.isUpdateSuccess,
      this.product,
      required this.failureOption,
      required this.updateFailureOption});

  @override
  final bool isLoading;
  @override
  final bool isUpdateLoading;
  @override
  final bool isUpdateSuccess;
  @override
  final ProductModel? product;
  @override
  final Option<MainFailure> failureOption;
  @override
  final Option<MainFailure> updateFailureOption;

  @override
  String toString() {
    return 'ProductDetailsState(isLoading: $isLoading, isUpdateLoading: $isUpdateLoading, isUpdateSuccess: $isUpdateSuccess, product: $product, failureOption: $failureOption, updateFailureOption: $updateFailureOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdateLoading, isUpdateLoading) ||
                other.isUpdateLoading == isUpdateLoading) &&
            (identical(other.isUpdateSuccess, isUpdateSuccess) ||
                other.isUpdateSuccess == isUpdateSuccess) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.failureOption, failureOption) ||
                other.failureOption == failureOption) &&
            (identical(other.updateFailureOption, updateFailureOption) ||
                other.updateFailureOption == updateFailureOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isUpdateLoading,
      isUpdateSuccess, product, failureOption, updateFailureOption);

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailsStateImplCopyWith<_$ProductDetailsStateImpl> get copyWith =>
      __$$ProductDetailsStateImplCopyWithImpl<_$ProductDetailsStateImpl>(
          this, _$identity);
}

abstract class _ProductDetailsState implements ProductDetailsState {
  const factory _ProductDetailsState(
          {required final bool isLoading,
          required final bool isUpdateLoading,
          required final bool isUpdateSuccess,
          final ProductModel? product,
          required final Option<MainFailure> failureOption,
          required final Option<MainFailure> updateFailureOption}) =
      _$ProductDetailsStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isUpdateLoading;
  @override
  bool get isUpdateSuccess;
  @override
  ProductModel? get product;
  @override
  Option<MainFailure> get failureOption;
  @override
  Option<MainFailure> get updateFailureOption;

  /// Create a copy of ProductDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductDetailsStateImplCopyWith<_$ProductDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
