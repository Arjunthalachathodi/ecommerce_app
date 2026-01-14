import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class MainFailure with _$MainFailure {
  const factory MainFailure.customError({
    required String errorMsg,
  }) = CustomError;

  const factory MainFailure.genericError({
    required String errorMsg,
  }) = GenericError;

  const factory MainFailure.serverError({
    required String errorMsg,
  }) = ServerError;
}
