import 'package:promolider_app/features/auth/domain/datasources/auth_datasource.dart';
import 'package:promolider_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this.authDatasource);

  final AuthDatasource authDatasource;

  @override
  Future<bool> signIn({
    required String username,
    required String password,
  }) async {
    final bool signInSuccess =
        await authDatasource.signIn(username: username, password: password);
    return signInSuccess;
  }

  @override
  Future<void> signOut() async {
    await authDatasource.signOut();
  }

  @override
  Future<bool> recoverPassword(String email) async {
    bool isEmailSended = await authDatasource.recoverPassword(email);
    return isEmailSended;
  }
}
