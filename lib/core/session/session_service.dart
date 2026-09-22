import 'package:resgo/core/constants/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Responsible for reading/writing session data.
/// 
/// Why a dedicated service?
/// - Single source of truth for auth state
/// - Easy to clear everything on logout
/// - Screens never touch SharedPreferences directly

class SessionService {
  final SharedPreferences _prefs;

  SessionService(this._prefs);

  // ─── Token ───────────────────────────────────────────────
  Future<void> saveToken(String token) async {
    await _prefs.setString(StorageKeys.authToken, token);
    await _prefs.setBool(StorageKeys.isLoggedIn, true);
  }

  String? get token => _prefs.getString(StorageKeys.authToken);

  bool get isLoggedIn => _prefs.getBool(StorageKeys.isLoggedIn) ?? false;

  // ─── User info (optional) ────────────────────────────────
  Future<void> saveUser({required String name, required String email}) async {
    await _prefs.setString(StorageKeys.userName, name);
    await _prefs.setString(StorageKeys.userEmail, email);
  }

  String? get userName => _prefs.getString(StorageKeys.userName);
  String? get userEmail => _prefs.getString(StorageKeys.userEmail);

  // ─── Clear everything (logout) ───────────────────────────
  Future<void> clear() async {
    await _prefs.remove(StorageKeys.authToken);
    await _prefs.remove(StorageKeys.userName);
    await _prefs.remove(StorageKeys.userEmail);
    await _prefs.setBool(StorageKeys.isLoggedIn, false);
  }
}