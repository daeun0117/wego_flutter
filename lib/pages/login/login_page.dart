import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wegotogether_login/pages/bloc/kakao_login_bloc.dart';
import 'package:wegotogether_login/pages/bloc/kakao_login_event.dart';
import 'package:wegotogether_login/pages/bloc/kakao_login_state.dart';

class LoginPage extends StatelessWidget {
  final String title;

  LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            BlocBuilder<KakaoLoginBloc, KakaoLoginState>(
              builder: (context, state) {
                if (state is KakaoLoginLoading) {
                  return const CircularProgressIndicator();
                } else if (state is KakaoLoginSuccess) {
                  return Text(
                    "${state.user.nickName}님 어서오세요",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w800),
                  );
                } else {
                  return Text('유저 정보가 없습니다.');
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "We Go Together",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(
              height: 150,
            ),
            BlocBuilder<KakaoLoginBloc, KakaoLoginState>(
              builder: (context, state) => IconButton(
                icon: Image.asset('assets/images/kakao_login.png'),
                iconSize: 70,
                onPressed: () {
                  context.read<KakaoLoginBloc>().add(LoginWithKakao());
                },
              ),
            ),
            BlocBuilder<KakaoLoginBloc, KakaoLoginState>(
              builder: (context, state) => ElevatedButton(
                onPressed: () {
                  context.read<KakaoLoginBloc>().add(LogoutFromKakao());
                },
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
