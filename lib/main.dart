import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trips_iu/pages/edit_page.dart';
import 'package:trips_iu/pages/home_page.dart';
import 'package:trips_iu/pages/signin_page.dart';
import 'package:trips_iu/pages/signup_page.dart';
import 'package:trips_iu/pages/trips_page.dart';
import 'package:trips_iu/providers/auth_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,

      // theme data
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Color.fromARGB(255, 31, 180, 255),
            ),
      ),
    );
  }

  final _router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => SignInPage()),
    GoRoute(path: '/SignUpPage', builder: (context, state) => SignUpPage()),
    GoRoute(path: '/HomePage', builder: (context, state) => HomePage()),
    GoRoute(path: '/EditPage', builder: (context, state) => EditPage()),
    GoRoute(path: '/TripsPage', builder: (context, state) => TripsPage()),
  ]);
}
