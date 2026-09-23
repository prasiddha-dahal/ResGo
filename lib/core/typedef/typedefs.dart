import 'package:dartz/dartz.dart';
import 'package:resgo/core/api/error/app_error.dart';

/// Shared type aliases used across the app.
/// 
/// Why? Makes repository signatures clean and consistent.
// Example: EitherResponse<List<Product>> instead of Future<Either<AppError, List<Product>>>

typedef EitherResponse<T> = Future<Either<AppError, T>>;
typedef EitherAppError<T> = Either<AppError, T>;