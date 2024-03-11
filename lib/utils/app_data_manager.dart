import 'package:shared_preferences/shared_preferences.dart';

class AppDataManager {
  static final AppDataManager _instance = AppDataManager._internal();
  factory AppDataManager() => _instance;

  AppDataManager._internal();

  // Keys for storing data in SharedPreferences
  static const String _storeTokenKey = 'StoreToken';
  static const String _userTokenKey = 'UserToken';
  static const String _usernameKey = 'Username';
  static const String _userEmailKey = 'UserEmail';
  static const String _loggedInKey = 'LoggedIn';

  // SharedPreferences instance
  late SharedPreferences _prefs;

  // Initialize SharedPreferences
  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Store storeToken in local storage
  Future<void> setStoreToken(String token) async {
    await _prefs.setString(_storeTokenKey, token);
  }

  // Retrieve storeToken from local storage
  String getStoreToken() {
    return _prefs.getString(_storeTokenKey) ?? '';
  }

  // Clear storeToken from local storage
  Future<void> clearStoreToken() async {
    await _prefs.remove(_storeTokenKey);
  }

  // Store userToken in local storage
  Future<void> setUserToken(String token) async {
    await _prefs.setString(_userTokenKey, token);
  }

  // Retrieve userToken from local storage
  String getUserToken() {
    return _prefs.getString(_userTokenKey) ?? '';
  }

  // Clear userToken from local storage
  Future<void> clearUserToken() async {
    await _prefs.remove(_userTokenKey);
  }

  // Store username in local storage
  Future<void> setUsername(String username) async {
    await _prefs.setString(_usernameKey, username);
  }

  // Retrieve username from local storage
  String getUsername() {
    return _prefs.getString(_usernameKey) ?? '';
  }

  // Clear username from local storage
  Future<void> clearUsername() async {
    await _prefs.remove(_usernameKey);
  }

  // Store userEmail in local storage
  Future<void> setUserEmail(String email) async {
    await _prefs.setString(_userEmailKey, email);
  }

  // Retrieve userEmail from local storage
  String getUserEmail() {
    return _prefs.getString(_userEmailKey) ?? '';
  }

  // Clear userEmail from local storage
  Future<void> clearUserEmail() async {
    await _prefs.remove(_userEmailKey);
  }

  // Set logged in status
  Future<void> setLoggedIn(bool loggedIn) async {
    await _prefs.setBool(_loggedInKey, loggedIn);
  }

  // Check if user is logged in
  bool isLoggedIn() {
    return _prefs.getBool(_loggedInKey) ?? false;
  }

  // Clear all app data upon logout
  Future<void> logout() async {
    await clearStoreToken();
    await clearUserToken();
    await clearUsername();
    await clearUserEmail();
    await setLoggedIn(false);
    // Add more clearing logic for other data if needed
  }
}
