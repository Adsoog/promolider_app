abstract class AuthDatasource {
  /// SignIn
  /// Returns true or false depending backend response
  /// Require [username] & [password]
  Future<bool> signIn({
    required String username,
    required String password,
  });

  /// SignOut
  /// Delete the current session
  Future<void> signOut();

  /// RecoverPassword
  /// Sends an email that contains a link to change the password.
  /// Require [email]
  Future<bool> recoverPassword(String email);
}
