import 'package:local_auth/local_auth.dart';

class AuthService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> isBiometricAvailable() async {
    return await _localAuth.canCheckBiometrics;
  }

  Future<bool> authenticate() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to access this feature',
          options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        )
      );
    } catch (e) {
      print(e);
    }
    return isAuthenticated;
  }
}
