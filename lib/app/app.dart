import 'package:flutter/material.dart';
import 'package:untitled/presentation/onboarding/onboarding_view.dart';
import 'package:untitled/presentation/resources/routes_manager.dart';
import 'package:untitled/presentation/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  MyApp._internal(); //  واحد فقطinstanseفادنه هو named constructorيسمي هذا

  static final MyApp _instanse =
      MyApp._internal(); //singelton or single instance

  factory MyApp() => _instanse;
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}

class test extends StatelessWidget {
  const test({super.key});
  void update() {
    MyApp().current = 11;
  }

  void getupdate() {
    print(MyApp().current); //11
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class test2 extends StatelessWidget {
  const test2({super.key});

  void getupdate() {
    print(MyApp().current); //11
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
