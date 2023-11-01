import 'package:flutter/material.dart';
import 'package:promolider_app/features/auth/infrastructure/datasources/promolider_crm_api/promolider_crm_api.dart';
import 'package:provider/provider.dart';
//import 'package:promolider_app/features/auth/infrastructure/datasources/fake_store_api/fake_store_auth_datasource.dart';
import 'package:promolider_app/features/auth/infrastructure/repositories/auth_repository_impl.dart';
import 'package:promolider_app/features/auth/presentation/providers/providers.dart';
import 'package:promolider_app/shared/widgets/widgets.dart';

class AuthRepositoryProvider extends ChangeNotifier {
  AuthRepositoryProvider({required this.context});

  final AuthRepositoryImpl fakeStoreRepository = AuthRepositoryImpl(
    //FakeStoreAuthDatasource(),
    PromoliderCrmApi(),
  );

  final TextEditingController emailRecoverController = TextEditingController();
  bool _recoverPasswordResponse = false;
  bool _isLoading = false;
  String _errorText = '';

  final BuildContext context;

  String get errorText => _errorText;
  bool get isLoading => _isLoading;
  bool get recoverPasswordResponse => _recoverPasswordResponse;

  Future<bool> signIn({
    required String username,
    required String password,
    required bool isFromPrefs,
  }) async {
    isLoading = true;

    //? Get SignInScreenProvider
    final signInScreenProvider = context.read<SignInScreenProvider>();

    if (!isFromPrefs) {
      //? Check isValidForm
      if (!signInScreenProvider.isValidForm) {
        errorText = 'El formulario es inválido';
        return false;
      }
    }

    //? Send data user to backend
    final signInResponse = await fakeStoreRepository.signIn(
      username: username,
      password: password,
    );

    errorText =
        signInResponse ? '' : 'Error: El usuario o contraseña es incorrecto';

    isLoading = false;

    //? Return true or false depending if exists
    return signInResponse;
  }

  Future<void> signOut() async {
    await fakeStoreRepository.signOut();
  }

  Future<void> recoverPassword() async {
    if (emailRecoverController.text.isNotEmpty) {
      _recoverPasswordResponse = await fakeStoreRepository
          .recoverPassword(emailRecoverController.text);
    }
  }

  CustomErrorWidget getErrorWidget(String error) {
    errorText = error;
    return CustomErrorWidget(error: errorText);
  }

  set errorText(String errorText) {
    _errorText = errorText;
    notifyListeners();
  }

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  set recoverPasswordResponse(bool recoverPasswordResponse) {
    _recoverPasswordResponse = recoverPasswordResponse;
    notifyListeners();
  }
}
