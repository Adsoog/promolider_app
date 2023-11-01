import 'package:promolider_app/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:promolider_app/features/authentication/data/mappers/app_user_mapper.dart';
import 'package:promolider_app/features/authentication/data/models/app_user_api_model.dart';
import 'package:promolider_app/features/authentication/domain/entities/app_user.dart';
import 'package:promolider_app/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AppUserMapper _mapper = AppUserMapper();

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AppUser> signIn(String username, String password) async {
    final AppUserApiModel responseModel =
        (await remoteDataSource.signIn(username, password)) as AppUserApiModel;
    return _mapper.fromModelToEntity(
        responseModel); // Usar el mapper para transformar el modelo a entidad
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<AppUser> signUp(String username, String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  // Aquí puedes agregar las implementaciones de los otros métodos como signUp y signOut.
  // Por ejemplo:
  // @override
  // Future<void> signOut() async {
  //   await remoteDataSource.logout();
  // }

  // @override
  // Future<User> signUp(String username, String password) async {
  //   final Map<String, dynamic> response = await remoteDataSource.register(username, password);
  //   final UserModel userModel = UserModel.fromJson(response);
  //   return userModel.toEntity();
  // }
}
