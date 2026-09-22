import 'package:internet_connection_checker/internet_connection_checker.dart';

/// Abstraction over internet connectivity.
/// 
/// Why abstract?
/// - Easy to mock in tests
/// - We can later swap the implementation without touching repositories

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}