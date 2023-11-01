import 'package:promolider_app/features/authentication/domain/entities/app_user.dart';
import 'package:promolider_app/features/authentication/domain/repositories/auth_repository.dart';

class SignUp {
  final AuthRepository repository;

  SignUp(this.repository);

  Future<AppUser> call(String username, String email, String password) async {
    return await repository.signUp(username, email, password);
  }
}
