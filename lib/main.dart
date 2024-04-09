import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:wegotogether_login/pages/bloc/kakao_login_bloc.dart';
import 'package:wegotogether_login/pages/login/login_page.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '3c57cca420adb0f9d0fce518c1eaeb9a');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KakaoLoginBloc(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginPage(
          title: 'login page',
        ),
      ),
    );
  }
}
