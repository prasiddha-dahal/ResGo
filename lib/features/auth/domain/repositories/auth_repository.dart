import 'package:resgo/core/typedef/typedefs.dart';
import 'package:resgo/features/auth/data/models/requests/login_request/login_request.dart';
import 'package:resgo/features/auth/data/models/requests/register_request/register_request.dart';
import 'package:resgo/features/auth/data/models/responses/login_response/login_response.dart';
import 'package:resgo/features/auth/data/models/responses/register_response/register_response.dart';

/// Domain contract for authentication.
/// 
/// The presentation layer depends ONLY on this abstract class.
/// It has no idea about Dio, JSON, or SharedPreferences

abstract interface class AuthRepository {
  EitherResponse<RegisterResponse> register(RegisterRequest registerRequest);
  EitherResponse<LoginResponse> login(LoginRequest loginRequest);
  EitherResponse<void> logout();
}
