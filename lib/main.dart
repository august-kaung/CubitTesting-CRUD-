import 'package:crud/bloc/get/getcontact_cubit.dart';
import 'package:crud/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  locator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<GetContactCubit>(
        create: (context) => GetContactCubit(getIt.call()),
        child: HomeScreen(),
      ),
    );
  }
}
