import 'package:dartz/dartz.dart';
import 'package:resgo/core/api/base/base_remote_source.dart';
import 'package:resgo/core/api/error/app_error.dart';
import 'package:resgo/core/constants/api_endpoints.dart';
import 'package:resgo/core/session/session_service.dart';
import 'package:resgo/core/typedef/typedefs.dart';
import 'package:resgo/features/auth/data/models/requests/login_request/login_request.dart';
import 'package:resgo/features/auth/data/models/requests/register_request/register_request.dart';
import 'package:resgo/features/auth/data/models/responses/login_response/login_response.dart';
import 'package:resgo/features/auth/data/models/responses/register_response/register_response.dart';
import 'package:resgo/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends BaseRemoteSource implements AuthRepository {
  final SessionService sessionService;

  AuthRepositoryImpl({
    required this.sessionService,
    required super.dio,
    required super.networkInfo,
  });

  @override
  EitherResponse<LoginResponse> login(LoginRequest loginRequest) async {
    try {
      final response = await callApi(() async {
        final result = await dio.post(
          ApiEndpoints.login,
          data: loginRequest.toJson(),
        );
        return LoginResponse.fromJson(result.data as Map<String, dynamic>);
      });

      if (response.success && response.token.isNotEmpty) {
        await sessionService.saveToken(response.token);
        return right(response);
      }

      return left(AppError(message: response.message ?? 'Login Failed'));
    } on AppError catch (e) {
      return left(e);
    } catch (e) {
      return left(AppError(message: e.toString()));
    }
  }

  @override
  EitherResponse<RegisterResponse> register(
    RegisterRequest registerRequest,
  ) async {
    try {
      final response = await callApi(() async {
        final result = await dio.post(
          ApiEndpoints.register,
          data: registerRequest.toJson(),
        );
        return RegisterResponse.fromJson(result.data as Map<String, dynamic>);
      });

      if (response.success && response.token.isNotEmpty) {
        await sessionService.saveToken(response.token);
        return right(response);
      }

      return left(AppError(message: response.message ?? 'Registration Failed'));
    } on AppError catch (e) {
      return left(e);
    } catch (e) {
      return left(AppError(message: e.toString()));
    }
  }

  @override
  EitherResponse<void> logout() async {
    try {
      await callApi(() async {
        await dio.post(ApiEndpoints.logout);
      });
      await sessionService.clear();
      return right(null);
    } on AppError catch (e) {
      await sessionService.clear();
      return left(e);
    } catch (e) {
      await sessionService.clear();
      return left(AppError(message: e.toString()));
    }
  }
}
