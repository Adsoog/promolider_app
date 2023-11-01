import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:promolider_app/features/auth/presentation/providers/providers.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => InitialScreenProvider()),
  ChangeNotifierProvider(create: (context) => SignInScreenProvider()),
  ChangeNotifierProvider(
      create: (context) => AuthRepositoryProvider(context: context)),
];
