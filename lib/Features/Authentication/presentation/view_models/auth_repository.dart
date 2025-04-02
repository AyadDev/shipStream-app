class AuthRepository {
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    return username == "eyad" && password == "1234";
  }

  Future<bool> signUp({
    required String username,
    required String email,
    required String phoneCode,
    required String phoneNumber,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 5));

    return true;
  }

  Future<String?> forgotUsername({
    required String email,
  }) async {
    await Future.delayed(const Duration(seconds: 5));
    if (email == "example@example.com") {
      return "user";
    }
    return null;
  }

  Future<bool> forgotPassword({
    required String username,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return username == "user";
  }

  Future<bool> newPassword({
    required String username,
    required String newPassword,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<bool> newUsername({
    required String oldUsername,
    required String newUsername,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<bool> verifyOTP({
    required String otp,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return otp == "123456";
  }
}
