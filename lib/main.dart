//======= FLUTTER IMPORTS: =======//
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//======= PACKAGE IMPORTS =======//
import 'package:nb_utils/nb_utils.dart';

//======= PROJECT IMPORTS =======//
import 'application/export_blocs.dart';
import 'presentation/export_presentations.dart';
import 'utils/export_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(
          create: (BuildContext context) => SplashBloc(SplashBlocInitial())..add(StartInitEvent()),
        ),
      ],
      child: MaterialApp(
        title: mAppName,
        navigatorKey: navigatorKey,
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        darkTheme: AppTheme.darkTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
