import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/domain/core/failures/failures.dart';

















typedef Result<T> = Either<MainFailure, T>;





















typedef ResultFuture<T> = Future<Result<T>>;
