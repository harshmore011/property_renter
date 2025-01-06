import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/dependency_injector.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/home_screen/presentation/blocs/home_screen_bloc.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await injectDependencies();

  debugPrint("main():");

  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<HomeScreenBloc>()),
        ],
        child: const MyApp(),
      ));

  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("MyApp():");


    return MaterialApp(
      title: 'Property Renter',
      theme: sl<AppTheme>().theme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => sl<AppRouter>().generateRoute(settings),
    );
  }

}
