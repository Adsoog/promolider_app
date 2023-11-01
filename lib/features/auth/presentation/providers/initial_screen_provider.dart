import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:promolider_app/features/auth/presentation/providers/providers.dart';
import 'package:promolider_app/utils/router/router_utils.dart';
import 'package:provider/provider.dart';

enum InitialOptions { signIn, binaryTree, myWallet, shareLink }

class InitialScreenProvider extends ChangeNotifier {
  InitialOptions _selectedOption = InitialOptions.signIn;

  InitialOptions get selectedOption => _selectedOption;

  Future<(String, String)> getsavedUserDataOnPrefs() async {
    //? Get SharedPref instance
    final prefs = FlutterSecureStorage(aOptions: _getAndroidOptions());
    final username = await prefs.read(key: 'username') ?? '';
    final password = await prefs.read(key: 'password') ?? '';
    return (username, password);
  }

  //? Get Android options
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  //? Delete all data saves
  Future<void> deleteSavedUserData() async {
    final prefs = FlutterSecureStorage(aOptions: _getAndroidOptions());
    await prefs.deleteAll();
  }

  Future<void> signInExistsUser(BuildContext context, String route) async {
    final authProvider = context.read<AuthRepositoryProvider>();

    final (username, password) = await getsavedUserDataOnPrefs();
    if (username.isNotEmpty && password.isNotEmpty && context.mounted) {
      final bool isCorrect = await authProvider.signIn(
        username: username,
        password: password,
        isFromPrefs: true,
      );
      if (isCorrect && context.mounted) {
        context.goNamed(route);
      }
    } else {
      if (context.mounted) {
        context.goNamed(AppRoutes.signIn.routeName);
      }
    }
  }

  Future<void> saveUserDataOnPrefs({
    required String username,
    required String password,
  }) async {
    //? Get SharedPref instance
    const prefs = FlutterSecureStorage();
    await prefs.write(key: 'username', value: username);
    await prefs.write(key: 'password', value: password);
  }

  set selectedOption(InitialOptions selectedOption) {
    _selectedOption = selectedOption;
    notifyListeners();
  }
}
