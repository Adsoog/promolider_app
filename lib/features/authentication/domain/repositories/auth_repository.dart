import 'package:promolider_app/features/authentication/domain/entities/app_user.dart';

abstract class AuthRepository {
  /// Método para iniciar sesión.
  ///
  /// Devuelve un [User] si el inicio de sesión es exitoso.
  Future<AppUser> signIn(String username, String password);

  /// Método para registrarse.
  ///
  /// Devuelve un [User] si el registro es exitoso.
  Future<AppUser> signUp(String username, String email, String password);

  /// Método para cerrar sesión.
  Future<void> signOut();
}
