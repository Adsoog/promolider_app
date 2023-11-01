// auth_remote_data_source.dart

import 'package:dio/dio.dart';

class AuthRemoteDataSource {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: 'https://crm.promolider.org/api/v1'));

  // Iniciar sesión
  Future<Map<String, dynamic>> signIn(String username, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Error al iniciar sesión');
      }
    } catch (error) {
      rethrow;
    }
  }

  // Cerrar sesión
  // Nota: Aquí necesitarías el endpoint exacto y cualquier dato adicional para cerrar sesión.
  Future<void> signOut() async {
    try {
      final response = await _dio
          .post('/auth/logout'); // Asumiendo que el endpoint es '/auth/logout'
      if (response.statusCode != 200) {
        throw Exception('Error al cerrar sesión');
      }
    } catch (error) {
      rethrow;
    }
  }

  // Registrarse
  // Nota: Aquí necesitarías el endpoint exacto y cualquier dato adicional para registrarse.
  Future<Map<String, dynamic>> signUp({
    required String username,
    required String password,
    // Aquí puedes agregar más campos si es necesario, como email, nombre completo, etc.
  }) async {
    try {
      final response = await _dio.post(
        '/auth/register', // Asumiendo que el endpoint es '/auth/register'
        data: {
          'username': username,
          'password': password,
          // Aquí puedes agregar más campos si es necesario, como email, nombre completo, etc.
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Error al registrarse');
      }
    } catch (error) {
      rethrow;
    }
  }

  // Aquí puedes agregar más métodos para otros endpoints si es necesario.
}
