import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/kalkulator_bloc.dart';
import 'routes/routes.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => KalkulatorBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initial,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
