import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:promolider_app/features/auth/domain/datasources/auth_datasource.dart';

class PromoliderCrmApi implements AuthDatasource {
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://crm.promolider.org/api/v1'),
  );

  @override
  Future<bool> signIn({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post('/auth/login', data: {
        'username': username,
        'password': password,
      });
      return response.statusCode == 200;
    } on DioException {
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<bool> recoverPassword(String email) async {
    try {
      //? Valid if exists email
      final emailExists =
          faker.randomGenerator.boolean(); //Esta que actualizaal azar

      if (emailExists) {
        //? Send link to email
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}
