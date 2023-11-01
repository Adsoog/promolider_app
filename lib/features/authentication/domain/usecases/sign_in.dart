import 'package:promolider_app/features/authentication/domain/entities/app_user.dart';
import 'package:promolider_app/features/authentication/domain/repositories/auth_repository.dart';

class SignIn {
  final AuthRepository repository;

  SignIn(this.repository);

  Future<AppUser> call(String username, String password) async {
    return await repository.signIn(username, password);
  }
}
