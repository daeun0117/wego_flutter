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
        child: BlocBuilder<KakaoLoginBloc, KakaoLoginState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                if (state is KakaoLoginSuccess)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.user.nickName ?? '',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800),
                      ),
                      const Text(
                        '님 어서오세요',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800),
                      ),
                    ],
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
                  height: 200,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<KakaoLoginBloc>().add(LoginWithKakao());
                  },
                  child: const Text('KaKao Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<KakaoLoginBloc>().add(LogoutFromKakao());
                  },
                  child: const Text('Logout'),
                ),
                if (state is KakaoLoginLoading)
                  const CircularProgressIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }
}
