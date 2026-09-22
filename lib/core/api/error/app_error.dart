// Unified error type used throughout the app.
// 
// Why a single AppError?
// - Screens only need to know "something went wrong + message"
// - We can later map network errors, validation errors, server errors, etc.
// - Keeps UI free from DioException / SocketException details

class AppError {
  final String message;
  final int? statusCode;

  const AppError({
    required this.message,
    this.statusCode,
  });

  @override
  String toString() => 'AppError(message: $message, statusCode: $statusCode)';
}