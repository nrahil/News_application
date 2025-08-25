// lib/utils/user_data.dart

class UserData {
  String? username;
  String? email;

  // A singleton instance to access the data globally
  static final UserData _instance = UserData._internal();
  factory UserData() {
    return _instance;
  }
  UserData._internal();

  // Method to clear data on logout
  void clear() {
    username = null;
    email = null;
  }
}