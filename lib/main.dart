import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/databases/cache/cache_helper.dart';
import 'package:untitled/core/get_it/get_it.dart';
import 'package:untitled/future/user_future/presentation/cubit/user_cubit.dart';
import 'package:untitled/future/user_future/presentation/screens/user_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServise();
  await getIt<CacheHelper>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => UserCubit()..eitherFailureOrUser(1),
        child: const UserScreen(),
      ),
    );
  }
}
