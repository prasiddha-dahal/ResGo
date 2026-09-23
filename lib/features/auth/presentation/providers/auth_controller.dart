import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:resgo/core/providers/core_provider.dart';
import 'package:resgo/features/auth/data/models/requests/login_request/login_request.dart';
import 'package:resgo/features/auth/data/models/requests/register_request/register_request.dart';
import 'package:resgo/features/auth/presentation/providers/auth_providers.dart';

/// Possible states of the Auth flow.
enum AuthStatus { initial, loading, success, error }

class AuthState {
  final AuthStatus status;
  final String? message;

  const AuthState({this.status = AuthStatus.initial, this.message});

  AuthState copyWith({AuthStatus? status, String? message}) {
    return AuthState(
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}

/// Controller that screens talk to.
///
/// Screens never call the repository directly.
/// They only call methods on this controller and listen to AuthState.
class AuthController extends StateNotifier<AuthState> {
  final Ref ref;

  AuthController(this.ref) : super(const AuthState());

  Future<void> login(LoginRequest loginRequest) async {
    state = state.copyWith(status: AuthStatus.loading, message: null);

    final repository = ref.read(authRepositoryProvider);
    final result = await repository.login(loginRequest);

    result.fold(
      (error) {
        state = state.copyWith(
          status: AuthStatus.error,
          message: error.message,
        );
      },
      (loginResponse) {
        // Bump session revision so other providers can react
        ref.read(sessionRevisionProvider.notifier).state++;
        state = state.copyWith(status: AuthStatus.success);
      },
    );
  }

  Future<void> register(RegisterRequest registerRequest) async {
    state = state.copyWith(status: AuthStatus.loading, message: null);

    final repository = ref.read(authRepositoryProvider);
    final result = await repository.register(registerRequest);

    result.fold(
      (error) {
        state = state.copyWith(
          status: AuthStatus.error,
          message: error.message,
        );
      },
      (registerResponse) {
        ref.read(sessionRevisionProvider.notifier).state++;
        state = state.copyWith(status: AuthStatus.success);
      },
    );
  }

  Future<void> logout() async {
    state = state.copyWith(status: AuthStatus.loading);

    final repository = ref.read(authRepositoryProvider);
    await repository.logout();

    ref.read(sessionRevisionProvider.notifier).state++;
    state = const AuthState(status: AuthStatus.initial);
  }
}

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    return AuthController(ref);
  },
);
